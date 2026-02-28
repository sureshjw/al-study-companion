"use client";

import { useState } from "react";
import { cn } from "@/lib/utils/cn";
import { MathText } from "@/components/questions/math-renderer";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Lightbulb, BookOpen, Target, Languages } from "lucide-react";
import type { AIExplanation, LanguagePreference } from "@/types";

interface ExplanationCardProps {
  explanation: AIExplanation;
  showLanguageToggle?: boolean;
  defaultLanguage?: LanguagePreference;
}

export function ExplanationCard({
  explanation,
  showLanguageToggle = true,
  defaultLanguage = "english",
}: ExplanationCardProps) {
  const [activeLanguage, setActiveLanguage] = useState<"english" | "sinhala">(
    defaultLanguage === "both" ? "english" : defaultLanguage === "sinhala" ? "sinhala" : "english"
  );

  // Parse explanation text (assumes it might have both languages separated)
  const hasMultipleLanguages = explanation.language === "both";

  let englishText = explanation.explanation_text;
  let sinhalaText = "";

  if (hasMultipleLanguages) {
    // Try to split by language markers
    const englishMatch = explanation.explanation_text.match(
      /--- English Explanation ---\s*([\s\S]*?)(?=--- Sinhala Explanation ---|$)/i
    );
    const sinhalaMatch = explanation.explanation_text.match(
      /--- Sinhala Explanation ---\s*([\s\S]*?)(?=--- English Explanation ---|$)/i
    );

    if (englishMatch) englishText = englishMatch[1].trim();
    if (sinhalaMatch) sinhalaText = sinhalaMatch[1].trim();
  }

  return (
    <Card className="border-primary/20">
      <CardHeader className="pb-3">
        <div className="flex items-center justify-between">
          <CardTitle className="flex items-center gap-2 text-lg">
            <BookOpen className="h-5 w-5 text-primary" />
            AI Explanation
          </CardTitle>
          {showLanguageToggle && hasMultipleLanguages && (
            <div className="flex items-center gap-2">
              <Languages className="h-4 w-4 text-muted-foreground" />
              <Tabs
                value={activeLanguage}
                onValueChange={(v) => setActiveLanguage(v as "english" | "sinhala")}
              >
                <TabsList className="h-8">
                  <TabsTrigger value="english" className="text-xs px-2">
                    English
                  </TabsTrigger>
                  <TabsTrigger value="sinhala" className="text-xs px-2 sinhala-text">
                    සිංහල
                  </TabsTrigger>
                </TabsList>
              </Tabs>
            </div>
          )}
        </div>
      </CardHeader>
      <CardContent className="space-y-6">
        {/* Main Explanation */}
        <div
          className={cn(
            "explanation-content",
            activeLanguage === "sinhala" && "sinhala-text"
          )}
        >
          {hasMultipleLanguages ? (
            activeLanguage === "sinhala" && sinhalaText ? (
              <MathText text={sinhalaText} />
            ) : (
              <MathText text={englishText} />
            )
          ) : (
            <MathText text={explanation.explanation_text} />
          )}
        </div>

        {/* Key Concepts */}
        {explanation.key_concepts && explanation.key_concepts.length > 0 && (
          <div className="space-y-2">
            <h4 className="font-medium flex items-center gap-2 text-sm">
              <Target className="h-4 w-4" />
              Key Concepts
            </h4>
            <div className="flex flex-wrap gap-2">
              {explanation.key_concepts.map((concept, index) => (
                <Badge key={index} variant="secondary">
                  {concept}
                </Badge>
              ))}
            </div>
          </div>
        )}

        {/* Exam Tips */}
        {explanation.exam_tips && (
          <div className="exam-tip">
            <h4 className="font-medium flex items-center gap-2 text-amber-700 dark:text-amber-300 mb-2">
              <Lightbulb className="h-4 w-4" />
              Exam Tip
            </h4>
            <p
              className={cn(
                "text-sm text-amber-800 dark:text-amber-200",
                activeLanguage === "sinhala" && "sinhala-text"
              )}
            >
              <MathText text={explanation.exam_tips} />
            </p>
          </div>
        )}
      </CardContent>
    </Card>
  );
}
