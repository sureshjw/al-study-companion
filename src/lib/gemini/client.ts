import { GoogleGenerativeAI } from "@google/generative-ai";

const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY || "");

export const geminiFlash = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });
export const geminiPro = genAI.getGenerativeModel({ model: "gemini-1.5-pro" });

export function getModelForQuestionType(questionType: string) {
  // Use Pro for complex questions, Flash for MCQs
  if (questionType === "mcq" || questionType === "short_structured") {
    return geminiFlash;
  }
  return geminiPro;
}
