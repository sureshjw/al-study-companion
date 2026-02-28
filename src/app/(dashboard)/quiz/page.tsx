"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Label } from "@/components/ui/label";
import { Switch } from "@/components/ui/switch";
import { Brain, Clock, Target, Zap } from "lucide-react";
import { supabase } from "@/lib/supabase";
import { useToast } from "@/hooks/use-toast";
import type { SubjectCode, PaperType, PartType } from "@/types";

const quizModes = [
  {
    id: "quick",
    name: "Quick Practice",
    description: "10 random questions across all topics",
    icon: Zap,
    questions: 10,
    time: 15,
  },
  {
    id: "focused",
    name: "Focused Practice",
    description: "20 questions from selected topics",
    icon: Target,
    questions: 20,
    time: 30,
  },
  {
    id: "exam",
    name: "Exam Simulation",
    description: "Full paper simulation with time limit",
    icon: Clock,
    questions: 50,
    time: 60,
  },
];

const subjects: { code: SubjectCode; name: string; icon: string }[] = [
  { code: "combined_maths", name: "Combined Mathematics", icon: "∫" },
  { code: "physics", name: "Physics", icon: "⚛" },
  { code: "chemistry", name: "Chemistry", icon: "🧪" },
];

export default function QuizPage() {
  const [selectedMode, setSelectedMode] = useState<string | null>(null);
  const [selectedSubject, setSelectedSubject] = useState<SubjectCode | null>(null);
  const [selectedPart, setSelectedPart] = useState<PartType | null>(null);
  const [isTimed, setIsTimed] = useState(true);
  const [isLoading, setIsLoading] = useState(false);
  const router = useRouter();
  const { toast } = useToast();

  const startQuiz = async () => {
    if (!selectedMode || !selectedSubject) {
      toast({
        title: "Selection Required",
        description: "Please select a quiz mode and subject.",
        variant: "destructive",
      });
      return;
    }

    setIsLoading(true);

    try {
      const {
        data: { user },
      } = await supabase.auth.getUser();

      if (!user) {
        toast({
          title: "Login Required",
          description: "Please log in to start a quiz.",
          variant: "destructive",
        });
        router.push("/login");
        return;
      }

      // Get subject ID
      const { data: subject } = await supabase
        .from("subjects")
        .select("id")
        .eq("code", selectedSubject)
        .single();

      if (!subject) {
        throw new Error("Subject not found");
      }

      // Fetch random questions based on mode
      const mode = quizModes.find((m) => m.id === selectedMode);
      const questionCount = mode?.questions || 10;

      // Build query
      let query = supabase
        .from("questions")
        .select("id, papers!inner(subject_id)")
        .eq("papers.subject_id", subject.id);

      if (selectedPart) {
        query = query.eq("part_type", selectedPart);
      }

      // For MCQ-focused quizzes in Physics/Chemistry
      if (selectedMode === "quick" && (selectedSubject === "physics" || selectedSubject === "chemistry")) {
        query = query.eq("question_type", "mcq");
      }

      const { data: questions, error } = await query.limit(questionCount * 2);

      if (error || !questions || questions.length === 0) {
        toast({
          title: "No Questions Available",
          description: "No questions found for the selected criteria.",
          variant: "destructive",
        });
        setIsLoading(false);
        return;
      }

      // Shuffle and take required number
      const shuffled = questions.sort(() => Math.random() - 0.5);
      const selectedQuestions = shuffled.slice(0, questionCount);
      const questionIds = selectedQuestions.map((q) => q.id);

      // Create quiz session
      const { data: session, error: sessionError } = await supabase
        .from("quiz_sessions")
        .insert({
          user_id: user.id,
          subject_code: selectedSubject,
          part_type: selectedPart,
          question_ids: questionIds,
          is_timed: isTimed,
          time_limit_minutes: isTimed ? mode?.time : null,
        })
        .select()
        .single();

      if (sessionError) {
        throw sessionError;
      }

      // Redirect to quiz
      router.push(`/quiz/${session.id}`);
    } catch (error) {
      console.error("Error starting quiz:", error);
      toast({
        title: "Error",
        description: "Failed to start quiz. Please try again.",
        variant: "destructive",
      });
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="space-y-8 page-transition max-w-4xl mx-auto">
      <div>
        <h1 className="text-3xl font-bold mb-2 flex items-center gap-3">
          <Brain className="h-8 w-8 text-primary" />
          Quiz Mode
        </h1>
        <p className="text-muted-foreground">
          Test your knowledge with timed quizzes and instant feedback
        </p>
      </div>

      {/* Quiz Mode Selection */}
      <div className="space-y-4">
        <Label className="text-lg font-semibold">Select Quiz Mode</Label>
        <div className="grid md:grid-cols-3 gap-4">
          {quizModes.map((mode) => (
            <Card
              key={mode.id}
              className={`cursor-pointer transition-all ${
                selectedMode === mode.id
                  ? "border-primary ring-2 ring-primary/20"
                  : "hover:border-primary/50"
              }`}
              onClick={() => setSelectedMode(mode.id)}
            >
              <CardHeader className="pb-2">
                <mode.icon className="h-8 w-8 text-primary mb-2" />
                <CardTitle className="text-base">{mode.name}</CardTitle>
                <CardDescription className="text-xs">
                  {mode.description}
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="flex gap-2">
                  <Badge variant="secondary">{mode.questions} Qs</Badge>
                  <Badge variant="outline">{mode.time} min</Badge>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>

      {/* Subject Selection */}
      <div className="space-y-4">
        <Label className="text-lg font-semibold">Select Subject</Label>
        <div className="grid md:grid-cols-3 gap-4">
          {subjects.map((subject) => (
            <Card
              key={subject.code}
              className={`cursor-pointer transition-all ${
                selectedSubject === subject.code
                  ? "border-primary ring-2 ring-primary/20"
                  : "hover:border-primary/50"
              }`}
              onClick={() => setSelectedSubject(subject.code)}
            >
              <CardContent className="p-4 flex items-center gap-3">
                <span className="text-2xl">{subject.icon}</span>
                <span className="font-medium">{subject.name}</span>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>

      {/* Part Selection (for Combined Maths) */}
      {selectedSubject === "combined_maths" && (
        <div className="space-y-4">
          <Label className="text-lg font-semibold">Select Part (Optional)</Label>
          <Select
            value={selectedPart || ""}
            onValueChange={(v) => setSelectedPart(v as PartType || null)}
          >
            <SelectTrigger className="w-full max-w-xs">
              <SelectValue placeholder="All parts" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All Parts</SelectItem>
              <SelectItem value="part_a">Part A (25-mark questions)</SelectItem>
              <SelectItem value="part_b">Part B (150-mark questions)</SelectItem>
            </SelectContent>
          </Select>
        </div>
      )}

      {/* Options */}
      <Card>
        <CardContent className="p-4">
          <div className="flex items-center justify-between">
            <div>
              <Label htmlFor="timed" className="font-medium">
                Timed Mode
              </Label>
              <p className="text-sm text-muted-foreground">
                Enable countdown timer for exam simulation
              </p>
            </div>
            <Switch id="timed" checked={isTimed} onCheckedChange={setIsTimed} />
          </div>
        </CardContent>
      </Card>

      {/* Start Button */}
      <Button
        size="lg"
        className="w-full"
        onClick={startQuiz}
        disabled={!selectedMode || !selectedSubject || isLoading}
      >
        {isLoading ? "Preparing Quiz..." : "Start Quiz"}
      </Button>
    </div>
  );
}
