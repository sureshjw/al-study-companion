"use client";

import { useState } from "react";
import { cn } from "@/lib/utils/cn";
import { MathText } from "./math-renderer";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { Label } from "@/components/ui/label";
import { Badge } from "@/components/ui/badge";
import { Check, X } from "lucide-react";
import type { QuestionWithOptions, LanguagePreference } from "@/types";

interface MCQQuestionProps {
  question: QuestionWithOptions;
  selectedAnswer: string | null;
  onAnswerSelect: (answer: string) => void;
  showResult?: boolean;
  language?: LanguagePreference;
  disabled?: boolean;
}

export function MCQQuestion({
  question,
  selectedAnswer,
  onAnswerSelect,
  showResult = false,
  language = "english",
  disabled = false,
}: MCQQuestionProps) {
  const questionText =
    language === "sinhala" && question.question_text_si
      ? question.question_text_si
      : question.question_text;

  const options = question.options || [];
  const correctOption = options.find((opt) => opt.is_correct);

  return (
    <div className="space-y-6">
      {/* Question Header */}
      <div className="flex items-start justify-between gap-4">
        <div className="flex-1">
          <div className="flex items-center gap-2 mb-2">
            <Badge variant="outline">Q{question.question_number}</Badge>
            <Badge variant="secondary">{question.marks} mark{question.marks > 1 ? "s" : ""}</Badge>
            {question.topic_tags.map((tag) => (
              <Badge key={tag} variant="outline" className="text-xs">
                {tag}
              </Badge>
            ))}
          </div>
          <div className={cn("text-lg", language === "sinhala" && "sinhala-text")}>
            <MathText text={questionText} />
          </div>
        </div>
      </div>

      {/* Options */}
      <RadioGroup
        value={selectedAnswer || ""}
        onValueChange={onAnswerSelect}
        disabled={disabled || showResult}
        className="space-y-3"
      >
        {options.map((option) => {
          const isSelected = selectedAnswer === option.option_label;
          const isCorrect = option.is_correct;
          const optionText =
            language === "sinhala" && option.option_text_si
              ? option.option_text_si
              : option.option_text;

          let optionClass = "mcq-option";
          if (showResult) {
            if (isCorrect) {
              optionClass += " correct";
            } else if (isSelected && !isCorrect) {
              optionClass += " incorrect";
            }
          } else if (isSelected) {
            optionClass += " selected";
          }

          return (
            <div key={option.id} className={optionClass}>
              <RadioGroupItem
                value={option.option_label}
                id={`option-${option.id}`}
                className="sr-only"
              />
              <Label
                htmlFor={`option-${option.id}`}
                className="flex items-center gap-3 cursor-pointer flex-1"
              >
                <span
                  className={cn(
                    "flex items-center justify-center w-8 h-8 rounded-full border-2 text-sm font-medium transition-colors",
                    isSelected && !showResult && "border-primary bg-primary text-primary-foreground",
                    showResult && isCorrect && "border-green-500 bg-green-500 text-white",
                    showResult && isSelected && !isCorrect && "border-red-500 bg-red-500 text-white",
                    !isSelected && !showResult && "border-muted-foreground/30"
                  )}
                >
                  {showResult && isCorrect ? (
                    <Check className="h-4 w-4" />
                  ) : showResult && isSelected && !isCorrect ? (
                    <X className="h-4 w-4" />
                  ) : (
                    option.option_label
                  )}
                </span>
                <span className={cn(language === "sinhala" && "sinhala-text")}>
                  <MathText text={optionText} />
                </span>
              </Label>
            </div>
          );
        })}
      </RadioGroup>

      {/* Result Feedback */}
      {showResult && selectedAnswer && (
        <div
          className={cn(
            "p-4 rounded-lg",
            selectedAnswer === correctOption?.option_label
              ? "bg-green-50 dark:bg-green-950 border border-green-200 dark:border-green-800"
              : "bg-red-50 dark:bg-red-950 border border-red-200 dark:border-red-800"
          )}
        >
          {selectedAnswer === correctOption?.option_label ? (
            <p className="text-green-700 dark:text-green-300 font-medium flex items-center gap-2">
              <Check className="h-5 w-5" />
              Correct! Well done.
            </p>
          ) : (
            <p className="text-red-700 dark:text-red-300 font-medium flex items-center gap-2">
              <X className="h-5 w-5" />
              Incorrect. The correct answer is {correctOption?.option_label}.
            </p>
          )}
        </div>
      )}
    </div>
  );
}
