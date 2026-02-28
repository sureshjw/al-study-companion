import { NextRequest, NextResponse } from "next/server";
import { createServerSupabaseClient } from "@/lib/supabase/server";
import { geminiFlash, MASTER_SYSTEM_PROMPT, SINHALA_SYSTEM_PROMPT } from "@/lib/gemini";
import type { LanguagePreference } from "@/types";

const CHAT_SYSTEM_PROMPT = `You are an expert Sri Lankan GCE Advanced Level tutor specialized in Combined Mathematics, Physics, and Chemistry.

Your role:
- Answer questions clearly and concisely
- Explain concepts step-by-step
- Provide examples relevant to A/L exams
- Give exam tips when appropriate
- Use proper mathematical notation (LaTeX with $ delimiters for inline, $$ for block)
- Reference Sri Lankan syllabus and past paper patterns when relevant

Rules:
- Keep answers focused and exam-relevant
- Highlight key concepts and formulas
- Mention common mistakes students make
- If the question is unclear, ask for clarification
- Always end with a brief exam tip or key takeaway`;

const CHAT_SINHALA_PROMPT = `ඔබ ශ්‍රී ලංකාවේ GCE A/L සංයුක්ත ගණිතය, භෞතික විද්‍යාව සහ රසායන විද්‍යාව සඳහා විශේෂඥ ගුරුතුමෙක් වේ.

ඔබගේ කාර්යය:
- ප්‍රශ්න පැහැදිලිව හා සංක්ෂිප්තව පිළිතුරු දෙන්න
- සංකල්ප පියවරෙන් පියවර පැහැදිලි කරන්න
- A/L විභාගවලට අදාළ උදාහරණ ලබාදෙන්න
- විභාග උපදෙස් ලබාදෙන්න

නියමයන්:
- විභාගයට අදාළ පිළිතුරු දෙන්න
- ප්‍රධාන සංකල්ප සහ සූත්‍ර ඉස්මතු කරන්න
- ශිෂ්‍යයන් කරන පොදු වැරදි සඳහන් කරන්න`;

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { message, language = "english", history = [] } = body as {
      message: string;
      language: LanguagePreference;
      history: { role: "user" | "assistant"; content: string }[];
    };

    if (!message) {
      return NextResponse.json(
        { error: "Message is required" },
        { status: 400 }
      );
    }

    const supabase = await createServerSupabaseClient();

    // Check rate limiting (simple: 50 requests per hour for free users)
    const {
      data: { user },
    } = await supabase.auth.getUser();

    if (user) {
      // Get user subscription status
      const { data: profile } = await supabase
        .from("profiles")
        .select("subscription_status")
        .eq("id", user.id)
        .single();

      // For demo purposes, allow all requests
      // In production, implement proper rate limiting
    }

    // Build conversation context
    const systemPrompt =
      language === "sinhala" ? CHAT_SINHALA_PROMPT : CHAT_SYSTEM_PROMPT;

    const conversationHistory = history.map((msg) => ({
      role: msg.role as "user" | "model",
      parts: [{ text: msg.content }],
    }));

    // Add system prompt as first user message if no history
    const contents =
      conversationHistory.length === 0
        ? [
            {
              role: "user" as const,
              parts: [{ text: `${systemPrompt}\n\nStudent question: ${message}` }],
            },
          ]
        : [
            ...conversationHistory.map((msg) => ({
              role: (msg.role === "user" ? "user" : "model") as "user" | "model",
              parts: msg.parts,
            })),
            {
              role: "user" as const,
              parts: [{ text: message }],
            },
          ];

    // Generate response
    const result = await geminiFlash.generateContent({
      contents,
      generationConfig: {
        maxOutputTokens: 1500,
        temperature: 0.4,
      },
    });

    const response = result.response.text();

    return NextResponse.json({ response });
  } catch (error) {
    console.error("Chat API error:", error);
    return NextResponse.json(
      { error: "Failed to generate response" },
      { status: 500 }
    );
  }
}
