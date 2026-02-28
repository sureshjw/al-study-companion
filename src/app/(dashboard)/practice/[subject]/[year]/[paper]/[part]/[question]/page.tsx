"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { MCQQuestion } from "@/components/questions/mcq-question";
import { StructuredQuestion } from "@/components/questions/structured-question";
import { ExplanationCard } from "@/components/explanation/explanation-card";
import { supabase } from "@/lib/supabase";
import { useToast } from "@/hooks/use-toast";
import {
  ArrowLeft,
  ArrowRight,
  Loader2,
  ChevronLeft,
  ChevronRight,
} from "lucide-react";
import type {
  QuestionWithOptions,
  AIExplanation,
  LanguagePreference,
} from "@/types";

interface QuestionPageProps {
  params: Promise<{
    subject: string;
    year: string;
    paper: string;
    part: string;
    question: string;
  }>;
}

export default function QuestionPage({ params }: QuestionPageProps) {
  const [resolvedParams, setResolvedParams] = useState<{
    subject: string;
    year: string;
    paper: string;
    part: string;
    question: string;
  } | null>(null);
  const [question, setQuestion] = useState<QuestionWithOptions | null>(null);
  const [loading, setLoading] = useState(true);
  const [answer, setAnswer] = useState("");
  const [selectedOption, setSelectedOption] = useState<string | null>(null);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [explanation, setExplanation] = useState<AIExplanation | null>(null);
  const [userLanguage, setUserLanguage] = useState<LanguagePreference>("english");
  const [totalQuestions, setTotalQuestions] = useState(0);
  const router = useRouter();
  const { toast } = useToast();

  // Resolve params
  useEffect(() => {
    params.then(setResolvedParams);
  }, [params]);

  // Fetch question and user preferences
  useEffect(() => {
    if (!resolvedParams) return;

    async function fetchData() {
      setLoading(true);
      try {
        // Get user profile for language preference
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

        // Fetch the paper
        const { data: paper } = await supabase
          .from("papers")
          .select("id, subjects!inner(code)")
          .eq("paper_type", resolvedParams!.paper)
          .eq("year", parseInt(resolvedParams!.year))
          .eq("subjects.code", resolvedParams!.subject)
          .single();

        if (!paper) {
          toast({
            title: "Paper not found",
            description: "The requested paper could not be found.",
            variant: "destructive",
          });
          return;
        }

        // Count total questions in this part
        const { count } = await supabase
          .from("questions")
          .select("*", { count: "exact", head: true })
          .eq("paper_id", paper.id)
          .eq("part_type", resolvedParams!.part);
        setTotalQuestions(count || 0);

        // Fetch the question
        const { data: questionData } = await supabase
          .from("questions")
          .select("*")
          .eq("paper_id", paper.id)
          .eq("part_type", resolvedParams!.part)
          .eq("question_number", parseInt(resolvedParams!.question))
          .single();

        if (!questionData) {
          toast({
            title: "Question not found",
            description: "The requested question could not be found.",
            variant: "destructive",
          });
          return;
        }

        // If MCQ, fetch options
        let options = null;
        if (questionData.question_type === "mcq") {
          const { data: optionsData } = await supabase
            .from("question_options")
            .select("*")
            .eq("question_id", questionData.id)
            .order("option_label");
          options = optionsData;
        }

        setQuestion({
          ...questionData,
          options: options || undefined,
        });
      } catch (error) {
        console.error("Error fetching question:", error);
        toast({
          title: "Error",
          description: "Failed to load the question. Please try again.",
          variant: "destructive",
        });
      } finally {
        setLoading(false);
      }
    }

    fetchData();
  }, [resolvedParams, toast]);

  const fetchExplanation = async (
    questionId: string,
    studentAnswer: string,
    lang: LanguagePreference
  ) => {
    // Try the cache GET endpoint first (zero AI cost)
    try {
      const cacheRes = await fetch(
        `/api/questions/${questionId}/explanation?lang=${lang}`
      );
      if (cacheRes.ok) {
        const cacheData = await cacheRes.json();
        if (cacheData.cached && cacheData.explanation) {
          return cacheData.explanation;
        }
      }
    } catch {
      // Cache miss or network issue — fall through to generation
    }

    // Cache miss: generate via AI and persist to cache
    const response = await fetch("/api/questions/explain", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        questionId,
        studentAnswer,
        language: lang,
      }),
    });

    if (!response.ok) return null;
    const data = await response.json();
    return data.explanation;
  };

  const handleSubmit = async () => {
    if (!question || !resolvedParams) return;

    const studentAnswer =
      question.question_type === "mcq" ? selectedOption : answer;
    if (!studentAnswer) return;

    setIsSubmitting(true);

    try {
      // Record the attempt
      const {
        data: { user },
      } = await supabase.auth.getUser();

      if (user) {
        const isCorrect =
          question.question_type === "mcq"
            ? selectedOption === question.correct_answer
            : false;

        await supabase.from("attempts").insert({
          user_id: user.id,
          question_id: question.id,
          student_answer: studentAnswer,
          is_correct: isCorrect,
          marks_obtained: isCorrect ? question.marks : 0,
        });
      }

      const result = await fetchExplanation(
        question.id,
        studentAnswer,
        userLanguage
      );

      if (result) {
        setExplanation(result);
      } else {
        toast({
          title: "AI Explanation Error",
          description: "Could not generate explanation. Please try again.",
          variant: "destructive",
        });
      }

      setIsSubmitted(true);
    } catch (error) {
      console.error("Error submitting answer:", error);
      toast({
        title: "Error",
        description: "Failed to submit your answer. Please try again.",
        variant: "destructive",
      });
    } finally {
      setIsSubmitting(false);
    }
  };

  const currentQuestionNum = resolvedParams
    ? parseInt(resolvedParams.question)
    : 1;
  const hasPrev = currentQuestionNum > 1;
  const hasNext = currentQuestionNum < totalQuestions;

  const navigateToQuestion = (num: number) => {
    if (!resolvedParams) return;
    router.push(
      `/practice/${resolvedParams.subject}/${resolvedParams.year}/${resolvedParams.paper}/${resolvedParams.part}/${num}`
    );
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <Loader2 className="h-8 w-8 animate-spin text-primary" />
      </div>
    );
  }

  if (!question || !resolvedParams) {
    return (
      <div className="text-center py-12">
        <p className="text-muted-foreground">Question not found.</p>
        <Link href="/practice">
          <Button variant="link">Back to Practice</Button>
        </Link>
      </div>
    );
  }

  return (
    <div className="space-y-6 page-transition max-w-4xl mx-auto">
      {/* Navigation Header */}
      <div className="flex items-center justify-between">
        <Link
          href={`/practice/${resolvedParams.subject}/${resolvedParams.year}/${resolvedParams.paper}`}
        >
          <Button variant="ghost" size="sm">
            <ArrowLeft className="h-4 w-4 mr-2" />
            Back to Paper
          </Button>
        </Link>
        <div className="flex items-center gap-2">
          <Button
            variant="outline"
            size="icon"
            disabled={!hasPrev}
            onClick={() => navigateToQuestion(currentQuestionNum - 1)}
          >
            <ChevronLeft className="h-4 w-4" />
          </Button>
          <span className="text-sm text-muted-foreground px-2">
            {currentQuestionNum} of {totalQuestions}
          </span>
          <Button
            variant="outline"
            size="icon"
            disabled={!hasNext}
            onClick={() => navigateToQuestion(currentQuestionNum + 1)}
          >
            <ChevronRight className="h-4 w-4" />
          </Button>
        </div>
      </div>

      {/* Question Card */}
      <Card>
        <CardContent className="p-6">
          {question.question_type === "mcq" ? (
            <MCQQuestion
              question={question}
              selectedAnswer={selectedOption}
              onAnswerSelect={setSelectedOption}
              showResult={isSubmitted}
              language={userLanguage}
              disabled={isSubmitting}
            />
          ) : (
            <StructuredQuestion
              question={question}
              answer={answer}
              onAnswerChange={setAnswer}
              onSubmit={handleSubmit}
              isSubmitting={isSubmitting}
              isSubmitted={isSubmitted}
              language={userLanguage}
            />
          )}

          {/* Submit button for MCQ */}
          {question.question_type === "mcq" && !isSubmitted && (
            <div className="mt-6">
              <Button
                onClick={handleSubmit}
                disabled={!selectedOption || isSubmitting}
                className="w-full sm:w-auto"
              >
                {isSubmitting ? (
                  <>
                    <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                    Checking...
                  </>
                ) : (
                  "Submit Answer"
                )}
              </Button>
            </div>
          )}
        </CardContent>
      </Card>

      {/* AI Explanation */}
      {isSubmitted && explanation && (
        <ExplanationCard
          explanation={explanation}
          showLanguageToggle={userLanguage === "both"}
          defaultLanguage={userLanguage}
        />
      )}

      {/* Navigation Footer */}
      {isSubmitted && (
        <div className="flex justify-between">
          <Button
            variant="outline"
            disabled={!hasPrev}
            onClick={() => {
              setIsSubmitted(false);
              setExplanation(null);
              setAnswer("");
              setSelectedOption(null);
              navigateToQuestion(currentQuestionNum - 1);
            }}
          >
            <ChevronLeft className="mr-2 h-4 w-4" />
            Previous Question
          </Button>
          <Button
            disabled={!hasNext}
            onClick={() => {
              setIsSubmitted(false);
              setExplanation(null);
              setAnswer("");
              setSelectedOption(null);
              navigateToQuestion(currentQuestionNum + 1);
            }}
          >
            Next Question
            <ChevronRight className="ml-2 h-4 w-4" />
          </Button>
        </div>
      )}
    </div>
  );
}
