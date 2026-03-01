import { NextRequest, NextResponse } from "next/server";
import {
  getCachedExplanation,
  getAllCachedExplanations,
} from "@/lib/cache/explanation-cache";
import type { LanguagePreference } from "@/types";

/**
 * GET /api/questions/:id/explanation?lang=english
 * Retrieves cached explanations without triggering AI generation.
 * Returns 404 if no cached explanation exists for the given language.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: { id: string } }
) {
  try {
    const { id: questionId } = params;
    const language = request.nextUrl.searchParams.get("lang") as
      | LanguagePreference
      | "all"
      | null;

    if (!questionId) {
      return NextResponse.json(
        { error: "Question ID is required" },
        { status: 400 }
      );
    }

    if (language === "all") {
      const explanations = await getAllCachedExplanations(questionId);
      return NextResponse.json({
        cached: explanations.length > 0,
        explanations,
        languages: explanations.map((e) => e.language),
      });
    }

    const lang: LanguagePreference = language || "english";
    const { hit, explanation } = await getCachedExplanation(questionId, lang);

    if (!hit || !explanation) {
      return NextResponse.json(
        { cached: false, explanation: null },
        { status: 404 }
      );
    }

    return NextResponse.json({ cached: true, explanation });
  } catch (error) {
    console.error("Error fetching cached explanation:", error);
    return NextResponse.json(
      { error: "Failed to fetch explanation" },
      { status: 500 }
    );
  }
}
