import { NextRequest, NextResponse } from "next/server";
import { createServerSupabaseClient } from "@/lib/supabase/server";
import {
  getModelForQuestionType,
  MASTER_SYSTEM_PROMPT,
  SINHALA_SYSTEM_PROMPT,
  getMCQPrompt,
  getStructuredPrompt,
  extractKeyConcepts,
  extractExamTip,
} from "@/lib/gemini";
import {
  getCachedExplanation,
  cacheExplanation,
} from "@/lib/cache/explanation-cache";
import type { LanguagePreference } from "@/types";

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { questionId, studentAnswer, language = "english" } = body as {
      questionId: string;
      studentAnswer: string;
      language: LanguagePreference;
    };

    if (!questionId || !studentAnswer) {
      return NextResponse.json(
        { error: "Missing required fields" },
        { status: 400 }
      );
    }

    // Check cache first (cache key = question_id + language)
    const { hit, explanation: cached } = await getCachedExplanation(
      questionId,
      language
    );

    if (hit && cached) {
      return NextResponse.json({ explanation: cached, cached: true });
    }

    const supabase = await createServerSupabaseClient();

    // Fetch question details
    const { data: question, error: questionError } = await supabase
      .from("questions")
      .select("*")
      .eq("id", questionId)
      .single();

    if (questionError || !question) {
      return NextResponse.json(
        { error: "Question not found" },
        { status: 404 }
      );
    }

    // Fetch options if MCQ
    let options: { label: string; text: string }[] = [];
    if (question.question_type === "mcq") {
      const { data: optionsData } = await supabase
        .from("question_options")
        .select("option_label, option_text")
        .eq("question_id", questionId)
        .order("option_label");

      options =
        optionsData?.map((o: { option_label: string; option_text: string }) => ({
          label: o.option_label,
          text: o.option_text,
        })) || [];
    }

    // Build prompt based on question type
    let prompt: string;
    if (question.question_type === "mcq") {
      prompt = getMCQPrompt(
        question.question_text,
        options,
        question.correct_answer,
        studentAnswer,
        language
      );
    } else {
      prompt = getStructuredPrompt(
        question.question_text,
        question.correct_answer,
        question.marking_scheme,
        studentAnswer,
        question.marks,
        question.question_type,
        language
      );
    }

    const systemPrompt =
      language === "sinhala" ? SINHALA_SYSTEM_PROMPT : MASTER_SYSTEM_PROMPT;

    const model = getModelForQuestionType(question.question_type);

    const maxTokensByType: Record<string, number> = {
      mcq: 500,
      short_structured: 1000,
      long_structured: 2000,
      essay: 2000,
      practical: 1500,
    };

    const result = await model.generateContent({
      contents: [
        {
          role: "user",
          parts: [{ text: `${systemPrompt}\n\n${prompt}` }],
        },
      ],
      generationConfig: {
        maxOutputTokens: maxTokensByType[question.question_type] ?? 1500,
        temperature: 0.3,
      },
    });

    const explanationText = result.response.text();
    const keyConcepts = extractKeyConcepts(explanationText);
    const examTips = extractExamTip(explanationText);

    // Persist to cache (upsert handles race conditions)
    const savedExplanation = await cacheExplanation({
      questionId,
      language,
      explanationText,
      examTips,
      keyConcepts,
    });

    return NextResponse.json({
      explanation: savedExplanation || {
        question_id: questionId,
        language,
        explanation_text: explanationText,
        exam_tips: examTips,
        key_concepts: keyConcepts,
      },
      cached: false,
    });
  } catch (error) {
    console.error("Error generating explanation:", error);
    return NextResponse.json(
      { error: "Failed to generate explanation" },
      { status: 500 }
    );
  }
}
