"use client";

import { useState } from "react";
import { cn } from "@/lib/utils/cn";
import { MathText } from "./math-renderer";
import { Textarea } from "@/components/ui/textarea";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Loader2 } from "lucide-react";
import type { QuestionWithOptions, LanguagePreference } from "@/types";

interface StructuredQuestionProps {
  question: QuestionWithOptions;
  answer: string;
  onAnswerChange: (answer: string) => void;
  onSubmit: () => void;
  isSubmitting?: boolean;
  isSubmitted?: boolean;
  language?: LanguagePreference;
}

export function StructuredQuestion({
  question,
  answer,
  onAnswerChange,
  onSubmit,
  isSubmitting = false,
  isSubmitted = false,
  language = "english",
}: StructuredQuestionProps) {
  const questionText =
    language === "sinhala" && question.question_text_si
      ? question.question_text_si
      : question.question_text;

  const isLongQuestion = question.question_type === "long_structured";
  const isEssay = question.question_type === "essay";

  return (
    <div className="space-y-6">
      {/* Question Header */}
      <div className="space-y-3">
        <div className="flex items-center gap-2 flex-wrap">
          <Badge variant="outline">Q{question.question_number}</Badge>
          <Badge variant="secondary">
            {question.marks} mark{question.marks > 1 ? "s" : ""}
          </Badge>
          <Badge
            variant={
              question.question_type === "short_structured"
                ? "default"
                : question.question_type === "long_structured"
                ? "destructive"
                : "outline"
            }
          >
            {question.question_type === "short_structured"
              ? "Part A"
              : question.question_type === "long_structured"
              ? "Part B"
              : question.question_type}
          </Badge>
          {question.topic_tags.map((tag) => (
            <Badge key={tag} variant="outline" className="text-xs">
              {tag}
            </Badge>
          ))}
        </div>

        <div
          className={cn(
            "text-lg leading-relaxed",
            language === "sinhala" && "sinhala-text"
          )}
        >
          <MathText text={questionText} />
        </div>

        {/* Display images if any */}
        {question.image_urls && question.image_urls.length > 0 && (
          <div className="flex flex-wrap gap-4 mt-4">
            {question.image_urls.map((url, index) => (
              <img
                key={index}
                src={url}
                alt={`Question diagram ${index + 1}`}
                className="max-w-md rounded-lg border shadow-sm"
              />
            ))}
          </div>
        )}
      </div>

      {/* Answer Input */}
      <div className="space-y-2">
        <label className="text-sm font-medium">
          Your Answer{" "}
          {language === "sinhala" && (
            <span className="sinhala-text text-muted-foreground">
              / ඔබගේ පිළිතුර
            </span>
          )}
        </label>
        <Textarea
          value={answer}
          onChange={(e) => onAnswerChange(e.target.value)}
          placeholder={
            language === "sinhala"
              ? "ඔබගේ පිළිතුර මෙහි ලියන්න..."
              : "Write your answer here..."
          }
          className={cn(
            "min-h-[150px]",
            isLongQuestion && "min-h-[300px]",
            isEssay && "min-h-[400px]",
            language === "sinhala" && "sinhala-text"
          )}
          disabled={isSubmitted || isSubmitting}
        />
        <p className="text-xs text-muted-foreground">
          {isLongQuestion || isEssay
            ? "Show your full working and explain each step clearly."
            : "Show your working where applicable."}
        </p>
      </div>

      {/* Marking Scheme Hint (if question allows) */}
      {question.marking_scheme && !isSubmitted && (
        <div className="bg-muted/50 p-4 rounded-lg">
          <p className="text-sm font-medium mb-2">Marking Guidance:</p>
          <p className="text-sm text-muted-foreground whitespace-pre-line">
            {question.marking_scheme}
          </p>
        </div>
      )}

      {/* Submit Button */}
      {!isSubmitted && (
        <Button
          onClick={onSubmit}
          disabled={!answer.trim() || isSubmitting}
          className="w-full sm:w-auto"
        >
          {isSubmitting ? (
            <>
              <Loader2 className="mr-2 h-4 w-4 animate-spin" />
              Getting AI Explanation...
            </>
          ) : (
            "Submit Answer"
          )}
        </Button>
      )}
    </div>
  );
}
