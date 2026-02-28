export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[];

export type Database = {
  public: {
    Tables: {
      subjects: {
        Row: {
          id: string;
          code: "combined_maths" | "physics" | "chemistry";
          name_en: string;
          name_si: string;
          color: string;
          icon: string;
          created_at: string;
        };
        Insert: {
          id?: string;
          code: "combined_maths" | "physics" | "chemistry";
          name_en: string;
          name_si: string;
          color?: string;
          icon?: string;
          created_at?: string;
        };
        Update: {
          id?: string;
          code?: "combined_maths" | "physics" | "chemistry";
          name_en?: string;
          name_si?: string;
          color?: string;
          icon?: string;
          created_at?: string;
        };
      };
      papers: {
        Row: {
          id: string;
          subject_id: string;
          paper_type: "paper_1" | "paper_2" | "paper_3";
          year: number;
          total_marks: number;
          raw_marks: number;
          description: string;
          duration_minutes: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          subject_id: string;
          paper_type: "paper_1" | "paper_2" | "paper_3";
          year: number;
          total_marks?: number;
          raw_marks?: number;
          description?: string;
          duration_minutes?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          subject_id?: string;
          paper_type?: "paper_1" | "paper_2" | "paper_3";
          year?: number;
          total_marks?: number;
          raw_marks?: number;
          description?: string;
          duration_minutes?: number;
          created_at?: string;
        };
      };
      questions: {
        Row: {
          id: string;
          paper_id: string;
          part_type: "part_a" | "part_b" | "part_c";
          question_number: number;
          question_type:
            | "mcq"
            | "short_structured"
            | "long_structured"
            | "essay"
            | "practical";
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
        };
        Insert: {
          id?: string;
          paper_id: string;
          part_type: "part_a" | "part_b" | "part_c";
          question_number: number;
          question_type:
            | "mcq"
            | "short_structured"
            | "long_structured"
            | "essay"
            | "practical";
          question_text: string;
          question_text_si?: string;
          correct_answer: string;
          marking_scheme?: string;
          marks: number;
          is_compulsory?: boolean;
          topic_tags?: string[];
          difficulty_level?: number;
          has_subparts?: boolean;
          image_urls?: string[];
          latex_content?: string | null;
          created_at?: string;
        };
        Update: {
          id?: string;
          paper_id?: string;
          part_type?: "part_a" | "part_b" | "part_c";
          question_number?: number;
          question_type?:
            | "mcq"
            | "short_structured"
            | "long_structured"
            | "essay"
            | "practical";
          question_text?: string;
          question_text_si?: string;
          correct_answer?: string;
          marking_scheme?: string;
          marks?: number;
          is_compulsory?: boolean;
          topic_tags?: string[];
          difficulty_level?: number;
          has_subparts?: boolean;
          image_urls?: string[];
          latex_content?: string | null;
          created_at?: string;
        };
      };
      question_options: {
        Row: {
          id: string;
          question_id: string;
          option_label: "A" | "B" | "C" | "D" | "E";
          option_text: string;
          option_text_si: string;
          is_correct: boolean;
          created_at: string;
        };
        Insert: {
          id?: string;
          question_id: string;
          option_label: "A" | "B" | "C" | "D" | "E";
          option_text: string;
          option_text_si?: string;
          is_correct?: boolean;
          created_at?: string;
        };
        Update: {
          id?: string;
          question_id?: string;
          option_label?: "A" | "B" | "C" | "D" | "E";
          option_text?: string;
          option_text_si?: string;
          is_correct?: boolean;
          created_at?: string;
        };
      };
      topics: {
        Row: {
          id: string;
          subject_id: string;
          name_en: string;
          name_si: string;
          parent_topic_id: string | null;
          syllabus_reference: string;
          created_at: string;
        };
        Insert: {
          id?: string;
          subject_id: string;
          name_en: string;
          name_si?: string;
          parent_topic_id?: string | null;
          syllabus_reference?: string;
          created_at?: string;
        };
        Update: {
          id?: string;
          subject_id?: string;
          name_en?: string;
          name_si?: string;
          parent_topic_id?: string | null;
          syllabus_reference?: string;
          created_at?: string;
        };
      };
      profiles: {
        Row: {
          id: string;
          email: string;
          name: string;
          language_preference: "sinhala" | "english" | "both";
          subscription_status: "free" | "premium" | "trial";
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id: string;
          email: string;
          name?: string;
          language_preference?: "sinhala" | "english" | "both";
          subscription_status?: "free" | "premium" | "trial";
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          email?: string;
          name?: string;
          language_preference?: "sinhala" | "english" | "both";
          subscription_status?: "free" | "premium" | "trial";
          created_at?: string;
          updated_at?: string;
        };
      };
      attempts: {
        Row: {
          id: string;
          user_id: string;
          question_id: string;
          student_answer: string;
          is_correct: boolean;
          marks_obtained: number;
          time_taken_seconds: number;
          attempted_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          question_id: string;
          student_answer: string;
          is_correct?: boolean;
          marks_obtained?: number;
          time_taken_seconds?: number;
          attempted_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          question_id?: string;
          student_answer?: string;
          is_correct?: boolean;
          marks_obtained?: number;
          time_taken_seconds?: number;
          attempted_at?: string;
        };
      };
      ai_explanations: {
        Row: {
          id: string;
          question_id: string;
          language: "sinhala" | "english" | "both";
          explanation_text: string;
          exam_tips: string;
          key_concepts: string[];
          created_at: string;
        };
        Insert: {
          id?: string;
          question_id: string;
          language: "sinhala" | "english" | "both";
          explanation_text: string;
          exam_tips?: string;
          key_concepts?: string[];
          created_at?: string;
        };
        Update: {
          id?: string;
          question_id?: string;
          language?: "sinhala" | "english" | "both";
          explanation_text?: string;
          exam_tips?: string;
          key_concepts?: string[];
          created_at?: string;
        };
      };
      user_weaknesses: {
        Row: {
          id: string;
          user_id: string;
          topic_id: string;
          accuracy_percentage: number;
          total_attempts: number;
          last_calculated_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          topic_id: string;
          accuracy_percentage?: number;
          total_attempts?: number;
          last_calculated_at?: string;
        };
        Update: {
          id?: string;
          user_id?: string;
          topic_id?: string;
          accuracy_percentage?: number;
          total_attempts?: number;
          last_calculated_at?: string;
        };
      };
      quiz_sessions: {
        Row: {
          id: string;
          user_id: string;
          subject_code: "combined_maths" | "physics" | "chemistry";
          paper_type: "paper_1" | "paper_2" | "paper_3" | null;
          part_type: "part_a" | "part_b" | "part_c" | null;
          question_ids: string[];
          answers: Json;
          is_timed: boolean;
          time_limit_minutes: number | null;
          started_at: string;
          completed_at: string | null;
          score: number | null;
        };
        Insert: {
          id?: string;
          user_id: string;
          subject_code: "combined_maths" | "physics" | "chemistry";
          paper_type?: "paper_1" | "paper_2" | "paper_3" | null;
          part_type?: "part_a" | "part_b" | "part_c" | null;
          question_ids: string[];
          answers?: Json;
          is_timed?: boolean;
          time_limit_minutes?: number | null;
          started_at?: string;
          completed_at?: string | null;
          score?: number | null;
        };
        Update: {
          id?: string;
          user_id?: string;
          subject_code?: "combined_maths" | "physics" | "chemistry";
          paper_type?: "paper_1" | "paper_2" | "paper_3" | null;
          part_type?: "part_a" | "part_b" | "part_c" | null;
          question_ids?: string[];
          answers?: Json;
          is_timed?: boolean;
          time_limit_minutes?: number | null;
          started_at?: string;
          completed_at?: string | null;
          score?: number | null;
        };
      };
    };
    Views: {
      [_ in never]: never;
    };
    Functions: {
      [_ in never]: never;
    };
    Enums: {
      subject_code: "combined_maths" | "physics" | "chemistry";
      paper_type: "paper_1" | "paper_2" | "paper_3";
      part_type: "part_a" | "part_b" | "part_c";
      question_type:
        | "mcq"
        | "short_structured"
        | "long_structured"
        | "essay"
        | "practical";
      language_pref: "sinhala" | "english" | "both";
      subscription_status: "free" | "premium" | "trial";
    };
  };
};
