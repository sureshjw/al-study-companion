import { createServerSupabaseClient } from "@/lib/supabase/server";
import type { LanguagePreference, AIExplanation } from "@/types";

export interface CacheResult {
  hit: boolean;
  explanation: AIExplanation | null;
}

export interface CacheStats {
  totalCached: number;
  byLanguage: Record<string, number>;
}

/**
 * Retrieve a cached AI explanation by question ID and language.
 * Cache key is the composite (question_id, language).
 */
export async function getCachedExplanation(
  questionId: string,
  language: LanguagePreference
): Promise<CacheResult> {
  const supabase = await createServerSupabaseClient();

  const { data, error } = await supabase
    .from("ai_explanations")
    .select("*")
    .eq("question_id", questionId)
    .eq("language", language)
    .single();

  if (error || !data) {
    return { hit: false, explanation: null };
  }

  return { hit: true, explanation: data as AIExplanation };
}

/**
 * Store an AI explanation in the cache. Uses upsert to handle
 * race conditions where two requests generate for the same key.
 */
export async function cacheExplanation(params: {
  questionId: string;
  language: LanguagePreference;
  explanationText: string;
  examTips: string;
  keyConcepts: string[];
}): Promise<AIExplanation | null> {
  const supabase = await createServerSupabaseClient();

  const { data, error } = await supabase
    .from("ai_explanations")
    .upsert(
      {
        question_id: params.questionId,
        language: params.language,
        explanation_text: params.explanationText,
        exam_tips: params.examTips,
        key_concepts: params.keyConcepts,
      },
      { onConflict: "question_id,language" }
    )
    .select()
    .single();

  if (error) {
    console.error("Failed to cache explanation:", error);
    return null;
  }

  return data as AIExplanation;
}

/**
 * Retrieve all cached explanations for a question across all languages.
 */
export async function getAllCachedExplanations(
  questionId: string
): Promise<AIExplanation[]> {
  const supabase = await createServerSupabaseClient();

  const { data, error } = await supabase
    .from("ai_explanations")
    .select("*")
    .eq("question_id", questionId)
    .order("language");

  if (error || !data) return [];
  return data as AIExplanation[];
}

/**
 * Invalidate (delete) cached explanations for a question.
 * Useful when question content is updated.
 */
export async function invalidateCache(
  questionId: string,
  language?: LanguagePreference
): Promise<boolean> {
  const supabase = await createServerSupabaseClient();

  let query = supabase
    .from("ai_explanations")
    .delete()
    .eq("question_id", questionId);

  if (language) {
    query = query.eq("language", language);
  }

  const { error } = await query;
  return !error;
}

/**
 * Get cache statistics for monitoring cache effectiveness.
 */
export async function getCacheStats(): Promise<CacheStats> {
  const supabase = await createServerSupabaseClient();

  const { data, error } = await supabase
    .from("ai_explanations")
    .select("language");

  if (error || !data) {
    return { totalCached: 0, byLanguage: {} };
  }

  const byLanguage: Record<string, number> = {};
  for (const row of data) {
    byLanguage[row.language] = (byLanguage[row.language] || 0) + 1;
  }

  return { totalCached: data.length, byLanguage };
}
