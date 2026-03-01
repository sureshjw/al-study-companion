import type { LanguagePreference, QuestionType } from "@/types";

// Master System Prompt - Used for all explanations
export const MASTER_SYSTEM_PROMPT = `You are an expert Sri Lankan GCE Advanced Level tutor.

Rules:
- Follow the official marking scheme strictly.
- Explain step-by-step suitable for Sri Lankan A/L students.
- Show full working for calculations with units.
- Highlight where marks are gained/lost.
- Use natural academic Sinhala (not literal translation) when requested.
- End with "Exam Tip" section.
- Keep explanations concise but thorough.`;

// Sinhala System Prompt
export const SINHALA_SYSTEM_PROMPT = `ඔබ ශ්‍රී ලංකාවේ GCE A/L විභාග සඳහා පළපුරුදු ගුරුතුමෙක් වේ.

අනිවාර්ය නියමයන්:

1. නිල ලකුණු යෝජනා (marking scheme) අනුව පමණක් පැහැදිලි කිරීම කරන්න.
2. සරල, පැහැදිලි, විභාගයට සුදුසු භාෂාව භාවිතා කරන්න.
3. ඉංග්‍රීසි වාක්‍ය රටාවන් සෘජුව පරිවර්තනය නොකරන්න.
4. ශ්‍රී ලංකාවේ පෙළපොත් භාවිතා කරන පද භාවිතා කරන්න.
5. අවශ්‍ය නම් පියවරෙන් පියවර විසඳුම දක්වන්න.
6. ශිෂ්‍යයාට ලකුණු අහිමි වූ ස්ථානය පැහැදිලි කරන්න.
7. අවසානයේ "විභාග උපදෙස්" කොටසක් එක් කරන්න.`;

// MCQ Explanation Prompt
export function getMCQPrompt(
  question: string,
  options: { label: string; text: string }[],
  correctAnswer: string,
  studentAnswer: string,
  language: LanguagePreference
): string {
  const optionsText = options.map((o) => `${o.label}. ${o.text}`).join("\n");

  if (language === "sinhala") {
    return `ප්‍රශ්නය:
${question}

විකල්ප:
${optionsText}

නිවැරදි පිළිතුර: ${correctAnswer}
ශිෂ්‍යයාගේ පිළිතුර: ${studentAnswer}

කරන්න:
1. නිවැරදි විකල්පය නිවැරදි වන්නේ මන්ද යන්න පැහැදිලි කරන්න.
2. අනෙකුත් විකල්ප වැරදි වන්නේ මන්ද යන්න කෙටියෙන් දක්වන්න.
3. විභාග උපදෙස් ලබාදෙන්න.

කෙටියෙන් හා පැහැදිලිව ලියන්න.`;
  }

  if (language === "both") {
    return `Question:
${question}

Options:
${optionsText}

Correct Answer: ${correctAnswer}
Student Answer: ${studentAnswer}

Provide explanation in BOTH Sinhala and English.

Structure the output as:

--- English Explanation ---
1. Explain why the correct option is correct.
2. Briefly explain why other options are wrong.
3. Provide an exam tip.

--- Sinhala Explanation ---
(Same content in academic Sinhala)

--- Exam Tip ---
(In both languages)`;
  }

  // English
  return `Question:
${question}

Options:
${optionsText}

Correct Answer: ${correctAnswer}
Student Answer: ${studentAnswer}

Tasks:
1. Explain why the correct option is correct.
2. Briefly explain why other options are wrong.
3. Provide an exam tip.

Keep it concise and focused on exam-relevant reasoning.`;
}

// Structured/Numerical Question Prompt
export function getStructuredPrompt(
  question: string,
  correctAnswer: string,
  markingScheme: string,
  studentAnswer: string,
  marks: number,
  questionType: QuestionType,
  language: LanguagePreference
): string {
  const isNumerical = questionType === "short_structured";

  if (language === "sinhala") {
    return `විෂය ප්‍රශ්නය:
${question}

නිවැරදි පිළිතුර:
${correctAnswer}

නිල ලකුණු යෝජනා:
${markingScheme}

ශිෂ්‍යයාගේ පිළිතුර:
${studentAnswer}

මුළු ලකුණු: ${marks}

කරන්න:

1. නිවැරදි විසඳුම පියවරෙන් පියවර පැහැදිලි කරන්න.
2. ශිෂ්‍යයාට ලකුණු අහිමි වූ ස්ථාන සඳහන් කරන්න.
3. ලකුණු බෙදාහැරීම පැහැදිලි කරන්න.
4. සම්පූර්ණ ලකුණු ලබාගැනීමට අවශ්‍ය ව්‍යුහගත පිළිතුර ලබාදෙන්න.
5. පහත කොටස් එක් කරන්න:

  - 🔑 ප්‍රධාන සංකල්ප සාරාංශය
  - 📝 විභාග උපදෙස්

${isNumerical ? "සූත්‍ර මුලින් ලියන්න. අගයන් ප්‍රතිස්ථාපනය කරන්න. ඒකක සඳහන් කරන්න." : ""}`;
  }

  if (language === "both") {
    return `Question:
${question}

Correct Answer:
${correctAnswer}

Marking Scheme:
${markingScheme}

Student Answer:
${studentAnswer}

Total Marks: ${marks}

Provide explanation in BOTH Sinhala and English.

--- English Explanation ---
1. Explain the correct solution step-by-step.
2. Point out where the student lost marks.
3. Show mark allocation for each step.
4. Provide the full structured answer for maximum marks.
${isNumerical ? "- Show formula first\n- Substitute values\n- Include units" : ""}
5. Key Concept Summary
6. Exam Tip

--- Sinhala Explanation ---
(Same content in academic Sinhala, using Sri Lankan textbook terminology)

--- Exam Tip ---
(In both languages)`;
  }

  // English
  return `Question:
${question}

Correct Answer:
${correctAnswer}

Marking Scheme:
${markingScheme}

Student Answer:
${studentAnswer}

Total Marks: ${marks}

Tasks:
1. Explain the correct solution step-by-step.
2. Clearly explain what the student did wrong (if applicable).
3. Show how marks are allocated.
4. Provide the final correct structured answer.
${isNumerical ? "- Write formulas first\n- Substitute values\n- Show units" : ""}
5. End with:
  - Key Concept Summary
  - Exam Tip`;
}

// Correct Answer Reinforcement (shorter response)
export function getCorrectAnswerPrompt(
  question: string,
  correctAnswer: string,
  markingScheme: string,
  language: LanguagePreference
): string {
  if (language === "sinhala") {
    return `ශිෂ්‍යයා නිවැරදිව පිළිතුරු දී ඇත.

ප්‍රශ්නය:
${question}

නිවැරදි පිළිතුර:
${correctAnswer}

ලකුණු යෝජනා:
${markingScheme}

කෙටියෙන්:
1. පිළිතුර නිවැරදි වන්නේ මන්දැයි තහවුරු කරන්න.
2. ප්‍රධාන සංකල්පය ශක්තිමත් කරන්න.
3. විභාග උපදෙසක් ලබාදෙන්න.`;
  }

  return `The student answered correctly.

Question:
${question}

Correct Answer:
${correctAnswer}

Marking Scheme:
${markingScheme}

Language: ${language}

Tasks:
1. Briefly confirm why the answer is correct.
2. Reinforce the key concept.
3. Mention how full marks are obtained in the exam.
4. Provide one exam tip.
Keep it concise.`;
}

// Extract key concepts from explanation
export function extractKeyConcepts(explanation: string): string[] {
  const concepts: string[] = [];
  
  // Look for common concept indicators
  const patterns = [
    /key concept[s]?:?\s*([^.]+)/gi,
    /important[:]?\s*([^.]+)/gi,
    /remember[:]?\s*([^.]+)/gi,
    /🔑\s*([^.]+)/g,
  ];

  patterns.forEach((pattern) => {
    const matches = Array.from(explanation.matchAll(pattern));
    for (const match of matches) {
      if (match[1] && match[1].length < 100) {
        concepts.push(match[1].trim());
      }
    }
  });

  return concepts.slice(0, 5); // Max 5 concepts
}

// Extract exam tips
export function extractExamTip(explanation: string): string {
  const patterns = [
    /exam tip[s]?:?\s*([^]*?)(?=---|$)/gi,
    /විභාග උපදෙස්[:]?\s*([^]*?)(?=---|$)/gi,
    /📝\s*([^]*?)(?=---|$)/g,
  ];

  for (const pattern of patterns) {
    const match = pattern.exec(explanation);
    if (match && match[1]) {
      return match[1].trim().slice(0, 500);
    }
  }

  return "";
}
