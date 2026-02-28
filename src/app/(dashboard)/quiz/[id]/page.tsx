"use client";

import { useState, useEffect, useCallback } from "react";
import { useRouter } from "next/navigation";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import { MCQQuestion } from "@/components/questions/mcq-question";
import { StructuredQuestion } from "@/components/questions/structured-question";
import { supabase } from "@/lib/supabase";
import { useToast } from "@/hooks/use-toast";
import {
  Clock,
  ChevronLeft,
  ChevronRight,
  CheckCircle2,
  Loader2,
  AlertTriangle,
} from "lucide-react";
import type { QuestionWithOptions, LanguagePreference } from "@/types";

interface QuizSessionPageProps {
  params: Promise<{ id: string }>;
}

export default function QuizSessionPage({ params }: QuizSessionPageProps) {
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [questions, setQuestions] = useState<QuestionWithOptions[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState<Record<string, string>>({});
  const [loading, setLoading] = useState(true);
  const [timeRemaining, setTimeRemaining] = useState<number | null>(null);
  const [isTimerRunning, setIsTimerRunning] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isCompleted, setIsCompleted] = useState(false);
  const [score, setScore] = useState<{ correct: number; total: number } | null>(null);
  const [userLanguage, setUserLanguage] = useState<LanguagePreference>("english");
  const router = useRouter();
  const { toast } = useToast();

  // Resolve params
  useEffect(() => {
    params.then((p) => setSessionId(p.id));
  }, [params]);

  // Load quiz session
  useEffect(() => {
    if (!sessionId) return;

    async function loadSession() {
      setLoading(true);
      try {
        // Get user language preference
        const {
          data: { user },
        } = await supabase.auth.getUser();
        if (user) {
          const { data: profile } = await supabase
            .from("profiles")
            .select("language_preference")
            .eq("id", user.id)
            .single();
          if (profile) {
            setUserLanguage(profile.language_preference);
          }
        }

        // Load session
        const { data: session, error } = await supabase
          .from("quiz_sessions")
          .select("*")
          .eq("id", sessionId)
          .single();

        if (error || !session) {
          toast({
            title: "Session not found",
            description: "This quiz session could not be found.",
            variant: "destructive",
          });
          router.push("/quiz");
          return;
        }

        // Check if already completed
        if (session.completed_at) {
          setIsCompleted(true);
          setScore({ correct: session.score || 0, total: session.question_ids.length });
        }

        // Load saved answers
        if (session.answers) {
          setAnswers(session.answers as Record<string, string>);
        }

        // Set timer
        if (session.is_timed && session.time_limit_minutes && !session.completed_at) {
          const elapsed = Math.floor(
            (Date.now() - new Date(session.started_at).getTime()) / 1000
          );
          const remaining = session.time_limit_minutes * 60 - elapsed;
          setTimeRemaining(Math.max(0, remaining));
          setIsTimerRunning(true);
        }

        // Load questions
        const { data: questionsData } = await supabase
          .from("questions")
          .select("*")
          .in("id", session.question_ids);

        if (questionsData) {
          // Maintain order from question_ids
          const orderedQuestions = session.question_ids
            .map((id: string) => questionsData.find((q) => q.id === id))
            .filter(Boolean) as QuestionWithOptions[];

          // Load options for MCQs
          const mcqIds = orderedQuestions
            .filter((q) => q.question_type === "mcq")
            .map((q) => q.id);

          if (mcqIds.length > 0) {
            const { data: options } = await supabase
              .from("question_options")
              .select("*")
              .in("question_id", mcqIds);

            orderedQuestions.forEach((q) => {
              if (q.question_type === "mcq") {
                q.options = options?.filter((o) => o.question_id === q.id);
              }
            });
          }

          setQuestions(orderedQuestions);
        }
      } catch (error) {
        console.error("Error loading session:", error);
        toast({
          title: "Error",
          description: "Failed to load quiz session.",
          variant: "destructive",
        });
      } finally {
        setLoading(false);
      }
    }

    loadSession();
  }, [sessionId, router, toast]);

  // Timer effect
  useEffect(() => {
    if (!isTimerRunning || timeRemaining === null) return;

    const interval = setInterval(() => {
      setTimeRemaining((prev) => {
        if (prev === null || prev <= 0) {
          setIsTimerRunning(false);
          return 0;
        }
        return prev - 1;
      });
    }, 1000);

    return () => clearInterval(interval);
  }, [isTimerRunning]);

  // Auto-submit when time runs out
  useEffect(() => {
    if (timeRemaining === 0 && !isCompleted) {
      handleSubmitQuiz();
    }
  }, [timeRemaining, isCompleted]);

  const handleAnswerChange = useCallback(
    (questionId: string, answer: string) => {
      setAnswers((prev) => ({ ...prev, [questionId]: answer }));
    },
    []
  );

  // Save progress periodically
  useEffect(() => {
    if (!sessionId || isCompleted || Object.keys(answers).length === 0) return;

    const saveProgress = async () => {
      await supabase
        .from("quiz_sessions")
        .update({ answers })
        .eq("id", sessionId);
    };

    const timeout = setTimeout(saveProgress, 2000);
    return () => clearTimeout(timeout);
  }, [answers, sessionId, isCompleted]);

  const handleSubmitQuiz = async () => {
    if (!sessionId || isSubmitting) return;

    setIsSubmitting(true);
    try {
      // Calculate score
      let correct = 0;
      questions.forEach((q) => {
        if (q.question_type === "mcq") {
          if (answers[q.id] === q.correct_answer) {
            correct++;
          }
        }
      });

      // Update session
      await supabase
        .from("quiz_sessions")
        .update({
          answers,
          completed_at: new Date().toISOString(),
          score: (correct / questions.length) * 100,
        })
        .eq("id", sessionId);

      // Record attempts
      const {
        data: { user },
      } = await supabase.auth.getUser();
      if (user) {
        const attempts = questions.map((q) => ({
          user_id: user.id,
          question_id: q.id,
          student_answer: answers[q.id] || "",
          is_correct: q.question_type === "mcq" ? answers[q.id] === q.correct_answer : false,
          marks_obtained: q.question_type === "mcq" && answers[q.id] === q.correct_answer ? q.marks : 0,
        }));

        await supabase.from("attempts").insert(attempts);
      }

      setIsCompleted(true);
      setScore({ correct, total: questions.length });
      setIsTimerRunning(false);

      toast({
        title: "Quiz Completed!",
        description: `You scored ${correct} out of ${questions.length} questions.`,
        variant: "success",
      });
    } catch (error) {
      console.error("Error submitting quiz:", error);
      toast({
        title: "Error",
        description: "Failed to submit quiz. Please try again.",
        variant: "destructive",
      });
    } finally {
      setIsSubmitting(false);
    }
  };

  const formatTime = (seconds: number) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins}:${secs.toString().padStart(2, "0")}`;
  };

  const currentQuestion = questions[currentIndex];
  const progress = ((currentIndex + 1) / questions.length) * 100;
  const answeredCount = Object.keys(answers).filter((id) =>
    questions.some((q) => q.id === id)
  ).length;

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <Loader2 className="h-8 w-8 animate-spin text-primary" />
      </div>
    );
  }

  if (isCompleted && score) {
    return (
      <div className="max-w-2xl mx-auto space-y-6 page-transition">
        <Card className="text-center">
          <CardContent className="py-12">
            <CheckCircle2 className="h-16 w-16 text-green-500 mx-auto mb-4" />
            <h2 className="text-2xl font-bold mb-2">Quiz Completed!</h2>
            <p className="text-4xl font-bold text-primary mb-4">
              {score.correct} / {score.total}
            </p>
            <p className="text-muted-foreground mb-6">
              {Math.round((score.correct / score.total) * 100)}% correct
            </p>
            <div className="flex gap-4 justify-center">
              <Button variant="outline" onClick={() => router.push("/quiz")}>
                New Quiz
              </Button>
              <Button onClick={() => router.push("/weakness")}>
                View Progress
              </Button>
            </div>
          </CardContent>
        </Card>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto space-y-4">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-4">
          <Badge variant="outline">
            Question {currentIndex + 1} of {questions.length}
          </Badge>
          <Badge variant="secondary">
            {answeredCount} answered
          </Badge>
        </div>
        {timeRemaining !== null && (
          <div
            className={`flex items-center gap-2 px-3 py-1 rounded-full ${
              timeRemaining < 60
                ? "bg-red-100 text-red-700 dark:bg-red-950 dark:text-red-300"
                : "bg-muted"
            }`}
          >
            <Clock className="h-4 w-4" />
            <span className="font-mono font-medium">
              {formatTime(timeRemaining)}
            </span>
          </div>
        )}
      </div>

      {/* Progress */}
      <Progress value={progress} className="h-2" />

      {/* Question */}
      <Card>
        <CardContent className="p-6">
          {currentQuestion?.question_type === "mcq" ? (
            <MCQQuestion
              question={currentQuestion}
              selectedAnswer={answers[currentQuestion.id] || null}
              onAnswerSelect={(answer) =>
                handleAnswerChange(currentQuestion.id, answer)
              }
              showResult={false}
              language={userLanguage}
            />
          ) : currentQuestion ? (
            <StructuredQuestion
              question={currentQuestion}
              answer={answers[currentQuestion.id] || ""}
              onAnswerChange={(answer) =>
                handleAnswerChange(currentQuestion.id, answer)
              }
              onSubmit={() => {}}
              isSubmitted={false}
              language={userLanguage}
            />
          ) : null}
        </CardContent>
      </Card>

      {/* Navigation */}
      <div className="flex justify-between">
        <Button
          variant="outline"
          onClick={() => setCurrentIndex((prev) => prev - 1)}
          disabled={currentIndex === 0}
        >
          <ChevronLeft className="mr-2 h-4 w-4" />
          Previous
        </Button>

        {currentIndex === questions.length - 1 ? (
          <Button onClick={handleSubmitQuiz} disabled={isSubmitting}>
            {isSubmitting ? (
              <>
                <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                Submitting...
              </>
            ) : (
              "Submit Quiz"
            )}
          </Button>
        ) : (
          <Button onClick={() => setCurrentIndex((prev) => prev + 1)}>
            Next
            <ChevronRight className="ml-2 h-4 w-4" />
          </Button>
        )}
      </div>

      {/* Question Navigator */}
      <Card>
        <CardHeader className="pb-2">
          <CardTitle className="text-sm">Question Navigator</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="flex flex-wrap gap-2">
            {questions.map((q, index) => (
              <Button
                key={q.id}
                variant={
                  currentIndex === index
                    ? "default"
                    : answers[q.id]
                    ? "secondary"
                    : "outline"
                }
                size="sm"
                className="w-10 h-10"
                onClick={() => setCurrentIndex(index)}
              >
                {index + 1}
              </Button>
            ))}
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
