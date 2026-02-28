// Enum types matching database
export type SubjectCode = 'combined_maths' | 'physics' | 'chemistry';
export type PaperType = 'paper_1' | 'paper_2' | 'paper_3';
export type PartType = 'part_a' | 'part_b' | 'part_c';
export type QuestionType = 'mcq' | 'short_structured' | 'long_structured' | 'essay' | 'practical';
export type LanguagePreference = 'sinhala' | 'english' | 'both';
export type SubscriptionStatus = 'free' | 'premium' | 'trial';

// Database types
export interface Subject {
  id: string;
  code: SubjectCode;
  name_en: string;
  name_si: string;
  color: string;
  icon: string;
}

export interface Paper {
  id: string;
  subject_id: string;
  paper_type: PaperType;
  year: number;
  total_marks: number;
  raw_marks: number;
  description: string;
  duration_minutes: number;
}

export interface Question {
  id: string;
  paper_id: string;
  part_type: PartType;
  question_number: number;
  question_type: QuestionType;
  question_text: string;
  question_text_si: string;
  correct_answer: string;
  marking_scheme: string;
  marks: number;
  is_compulsory: boolean;
  topic_tags: string[];
  difficulty_level: number;
  has_subparts: boolean;
  image_urls: string[];
  latex_content: string | null;
  created_at: string;
}

export interface QuestionOption {
  id: string;
  question_id: string;
  option_label: 'A' | 'B' | 'C' | 'D' | 'E';
  option_text: string;
  option_text_si: string;
  is_correct: boolean;
}

export interface Topic {
  id: string;
  subject_id: string;
  name_en: string;
  name_si: string;
  parent_topic_id: string | null;
  syllabus_reference: string;
}

export interface User {
  id: string;
  email: string;
  name: string;
  language_preference: LanguagePreference;
  subscription_status: SubscriptionStatus;
  created_at: string;
}

export interface Attempt {
  id: string;
  user_id: string;
  question_id: string;
  student_answer: string;
  is_correct: boolean;
  marks_obtained: number;
  time_taken_seconds: number;
  attempted_at: string;
}

export interface AIExplanation {
  id: string;
  question_id: string;
  language: LanguagePreference;
  explanation_text: string;
  exam_tips: string;
  key_concepts: string[];
  created_at: string;
}

export interface UserWeakness {
  id: string;
  user_id: string;
  topic_id: string;
  accuracy_percentage: number;
  total_attempts: number;
  last_calculated_at: string;
  topic?: Topic;
}

// Extended types for UI
export interface QuestionWithOptions extends Question {
  options?: QuestionOption[];
  paper?: Paper;
  subject?: Subject;
}

export interface AttemptWithDetails extends Attempt {
  question?: QuestionWithOptions;
}

export interface QuizSession {
  id: string;
  user_id: string;
  subject_code: SubjectCode;
  paper_type?: PaperType;
  part_type?: PartType;
  questions: QuestionWithOptions[];
  current_index: number;
  answers: Record<string, string>;
  start_time: string;
  end_time?: string;
  is_timed: boolean;
  time_limit_minutes?: number;
}

// API response types
export interface APIResponse<T> {
  data: T | null;
  error: string | null;
}

export interface PaginatedResponse<T> {
  data: T[];
  total: number;
  page: number;
  pageSize: number;
  hasMore: boolean;
}

// Stats types
export interface UserStats {
  totalAttempts: number;
  correctAnswers: number;
  accuracyPercentage: number;
  totalTimeSpent: number;
  streakDays: number;
  subjectBreakdown: {
    subject: SubjectCode;
    attempts: number;
    accuracy: number;
  }[];
  recentActivity: {
    date: string;
    attempts: number;
  }[];
}

export interface TopicPerformance {
  topic: Topic;
  attempts: number;
  correct: number;
  accuracy: number;
  averageTime: number;
  trend: 'improving' | 'declining' | 'stable';
}
