import Link from "next/link";
import { notFound } from "next/navigation";
import { createServerSupabaseClient } from "@/lib/supabase/server";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { ArrowLeft, Clock, FileText, CheckCircle2 } from "lucide-react";
import type { SubjectCode, PaperType, PartType } from "@/types";

interface PaperPageProps {
  params: Promise<{ subject: string; year: string; paper: string }>;
}

export default async function PaperPage({ params }: PaperPageProps) {
  const { subject: subjectCode, year: yearStr, paper: paperType } = await params;
  const year = parseInt(yearStr);
  const supabase = await createServerSupabaseClient();

  // Fetch paper with questions
  const { data: paper } = await supabase
    .from("papers")
    .select(`
      *,
      subjects(*),
      questions(*)
    `)
    .eq("paper_type", paperType)
    .eq("year", year)
    .eq("subjects.code", subjectCode)
    .single();

  if (!paper) {
    notFound();
  }

  // Group questions by part
  type QuestionType = { id: string; part_type: PartType; question_number: number; marks: number; topic_tags: string[] };
  const questionsByPart = paper.questions?.reduce(
    (acc: Record<PartType, QuestionType[]>, q: QuestionType) => {
      if (!acc[q.part_type]) {
        acc[q.part_type] = [];
      }
      acc[q.part_type].push(q);
      return acc;
    },
    {} as Record<PartType, QuestionType[]>
  );

  // Sort questions within each part
  Object.keys(questionsByPart || {}).forEach((part) => {
    questionsByPart[part as PartType]?.sort(
      (a, b) => a.question_number - b.question_number
    );
  });

  const availableParts = Object.keys(questionsByPart || {}) as PartType[];

  const partLabels: Record<PartType, string> = {
    part_a: "Part A",
    part_b: "Part B",
    part_c: "Part C",
  };

  const getPartDescription = (part: PartType): string => {
    if (subjectCode === "combined_maths") {
      return part === "part_a"
        ? "10 questions × 25 marks (all compulsory)"
        : "7 questions × 150 marks (answer any 5)";
    }
    if (subjectCode === "physics") {
      return part === "part_a"
        ? "4 questions × 20 marks"
        : "4 questions × 30 marks";
    }
    if (subjectCode === "chemistry") {
      if (part === "part_a") return "4 compulsory questions × 100 marks";
      if (part === "part_b") return "3 questions × 150 marks (answer 2)";
      return "3 questions × 150 marks (answer 2)";
    }
    return "";
  };

  return (
    <div className="space-y-6 page-transition">
      {/* Header */}
      <div className="flex items-center gap-4">
        <Link href={`/practice/${subjectCode}`}>
          <Button variant="ghost" size="icon">
            <ArrowLeft className="h-5 w-5" />
          </Button>
        </Link>
        <div className="flex-1">
          <div className="flex items-center gap-2 mb-1">
            <Badge variant="outline">{paper.subjects?.name_en}</Badge>
            <Badge variant="secondary">{year}</Badge>
          </div>
          <h1 className="text-2xl font-bold">
            {paperType === "paper_1"
              ? "Paper I"
              : paperType === "paper_2"
              ? "Paper II"
              : "Paper III"}
          </h1>
          <p className="text-muted-foreground">{paper.description}</p>
        </div>
        <div className="text-right">
          <div className="flex items-center gap-2 text-muted-foreground">
            <Clock className="h-4 w-4" />
            <span>{paper.duration_minutes} minutes</span>
          </div>
          <p className="text-sm text-muted-foreground">
            {paper.total_marks} marks
          </p>
        </div>
      </div>

      {/* MCQ Paper (Physics/Chemistry Paper I) */}
      {paperType === "paper_1" && (subjectCode === "physics" || subjectCode === "chemistry") && (
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <FileText className="h-5 w-5" />
              Multiple Choice Questions
            </CardTitle>
          </CardHeader>
          <CardContent>
            <p className="text-muted-foreground mb-4">
              50 questions, 1 mark each. Choose the best answer for each question.
            </p>
            <Link href={`/practice/${subjectCode}/${year}/${paperType}/part_a/1`}>
              <Button>Start MCQ Practice</Button>
            </Link>
          </CardContent>
        </Card>
      )}

      {/* Structured Paper Parts */}
      {(paperType !== "paper_1" || subjectCode === "combined_maths") && (
        <Tabs defaultValue={availableParts[0]} className="space-y-4">
          <TabsList className="grid w-full" style={{ gridTemplateColumns: `repeat(${availableParts.length}, 1fr)` }}>
            {availableParts.map((part) => (
              <TabsTrigger key={part} value={part}>
                {partLabels[part]}
              </TabsTrigger>
            ))}
          </TabsList>

          {availableParts.map((part) => (
            <TabsContent key={part} value={part} className="space-y-4">
              <Card>
                <CardHeader>
                  <CardTitle>{partLabels[part]}</CardTitle>
                  <p className="text-sm text-muted-foreground">
                    {getPartDescription(part)}
                  </p>
                </CardHeader>
                <CardContent>
                  <div className="grid gap-3">
                    {questionsByPart?.[part]?.map((question: { id: string; question_number: number; marks: number; topic_tags: string[] }) => (
                      <Link
                        key={question.id}
                        href={`/practice/${subjectCode}/${year}/${paperType}/${part}/${question.question_number}`}
                      >
                        <div className="flex items-center justify-between p-4 rounded-lg border hover:border-primary/50 hover:bg-muted/50 transition-all">
                          <div className="flex items-center gap-4">
                            <div className="w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center text-sm font-medium">
                              Q{question.question_number}
                            </div>
                            <div>
                              <p className="font-medium">
                                Question {question.question_number}
                              </p>
                              <div className="flex items-center gap-2 mt-1">
                                <Badge variant="outline" className="text-xs">
                                  {question.marks} marks
                                </Badge>
                                {question.topic_tags.slice(0, 2).map((tag: string) => (
                                  <Badge
                                    key={tag}
                                    variant="secondary"
                                    className="text-xs"
                                  >
                                    {tag}
                                  </Badge>
                                ))}
                              </div>
                            </div>
                          </div>
                          <Button variant="ghost" size="sm">
                            Practice
                          </Button>
                        </div>
                      </Link>
                    ))}
                  </div>
                </CardContent>
              </Card>
            </TabsContent>
          ))}
        </Tabs>
      )}

      {/* Empty state */}
      {availableParts.length === 0 && (
        <Card>
          <CardContent className="p-8 text-center">
            <p className="text-muted-foreground">
              No questions available for this paper yet. Check back later!
            </p>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
