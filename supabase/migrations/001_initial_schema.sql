-- A/L Study Companion Database Schema
-- Migration: 001_initial_schema

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create enum types
CREATE TYPE subject_code AS ENUM ('combined_maths', 'physics', 'chemistry');
CREATE TYPE paper_type AS ENUM ('paper_1', 'paper_2', 'paper_3');
CREATE TYPE part_type AS ENUM ('part_a', 'part_b', 'part_c');
CREATE TYPE question_type AS ENUM ('mcq', 'short_structured', 'long_structured', 'essay', 'practical');
CREATE TYPE language_pref AS ENUM ('sinhala', 'english', 'both');
CREATE TYPE subscription_status AS ENUM ('free', 'premium', 'trial');

-- Subjects table
CREATE TABLE subjects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code subject_code UNIQUE NOT NULL,
    name_en VARCHAR(100) NOT NULL,
    name_si VARCHAR(100) NOT NULL,
    color VARCHAR(20) DEFAULT '#3B82F6',
    icon VARCHAR(10) DEFAULT '📚',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Papers table
CREATE TABLE papers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    paper_type paper_type NOT NULL,
    year INTEGER NOT NULL CHECK (year >= 2000 AND year <= 2100),
    total_marks INTEGER DEFAULT 100,
    raw_marks INTEGER DEFAULT 100,
    description TEXT DEFAULT '',
    duration_minutes INTEGER DEFAULT 180,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(subject_id, paper_type, year)
);

-- Topics table
CREATE TABLE topics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    name_en VARCHAR(200) NOT NULL,
    name_si VARCHAR(200) DEFAULT '',
    parent_topic_id UUID REFERENCES topics(id) ON DELETE SET NULL,
    syllabus_reference VARCHAR(50) DEFAULT '',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Questions table
CREATE TABLE questions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    paper_id UUID NOT NULL REFERENCES papers(id) ON DELETE CASCADE,
    part_type part_type NOT NULL,
    question_number INTEGER NOT NULL,
    question_type question_type NOT NULL,
    question_text TEXT NOT NULL,
    question_text_si TEXT DEFAULT '',
    correct_answer TEXT NOT NULL,
    marking_scheme TEXT DEFAULT '',
    marks INTEGER NOT NULL CHECK (marks > 0),
    is_compulsory BOOLEAN DEFAULT TRUE,
    topic_tags TEXT[] DEFAULT '{}',
    difficulty_level INTEGER DEFAULT 3 CHECK (difficulty_level >= 1 AND difficulty_level <= 5),
    has_subparts BOOLEAN DEFAULT FALSE,
    image_urls TEXT[] DEFAULT '{}',
    latex_content TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(paper_id, part_type, question_number)
);

-- Question options table (for MCQs)
CREATE TABLE question_options (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    question_id UUID NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    option_label CHAR(1) NOT NULL CHECK (option_label IN ('A', 'B', 'C', 'D', 'E')),
    option_text TEXT NOT NULL,
    option_text_si TEXT DEFAULT '',
    is_correct BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(question_id, option_label)
);

-- Profiles table (extends Supabase auth.users)
CREATE TABLE profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email VARCHAR(255) NOT NULL,
    name VARCHAR(100) DEFAULT '',
    language_preference language_pref DEFAULT 'english',
    subscription_status subscription_status DEFAULT 'free',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Attempts table
CREATE TABLE attempts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    question_id UUID NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    student_answer TEXT NOT NULL,
    is_correct BOOLEAN DEFAULT FALSE,
    marks_obtained INTEGER DEFAULT 0,
    time_taken_seconds INTEGER DEFAULT 0,
    attempted_at TIMESTAMPTZ DEFAULT NOW()
);

-- AI Explanations cache table
CREATE TABLE ai_explanations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    question_id UUID NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    language language_pref NOT NULL,
    explanation_text TEXT NOT NULL,
    exam_tips TEXT DEFAULT '',
    key_concepts TEXT[] DEFAULT '{}',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(question_id, language)
);

-- User weaknesses table
CREATE TABLE user_weaknesses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    topic_id UUID NOT NULL REFERENCES topics(id) ON DELETE CASCADE,
    accuracy_percentage DECIMAL(5,2) DEFAULT 0,
    total_attempts INTEGER DEFAULT 0,
    last_calculated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, topic_id)
);

-- Quiz sessions table
CREATE TABLE quiz_sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    subject_code subject_code NOT NULL,
    paper_type paper_type,
    part_type part_type,
    question_ids UUID[] NOT NULL,
    answers JSONB DEFAULT '{}',
    is_timed BOOLEAN DEFAULT FALSE,
    time_limit_minutes INTEGER,
    started_at TIMESTAMPTZ DEFAULT NOW(),
    completed_at TIMESTAMPTZ,
    score DECIMAL(5,2)
);

-- Create indexes for performance
CREATE INDEX idx_papers_subject_year ON papers(subject_id, year);
CREATE INDEX idx_questions_paper ON questions(paper_id);
CREATE INDEX idx_questions_type ON questions(question_type);
CREATE INDEX idx_questions_topic_tags ON questions USING GIN(topic_tags);
CREATE INDEX idx_attempts_user ON attempts(user_id);
CREATE INDEX idx_attempts_question ON attempts(question_id);
CREATE INDEX idx_attempts_user_date ON attempts(user_id, attempted_at);
CREATE INDEX idx_ai_explanations_question ON ai_explanations(question_id);
CREATE INDEX idx_user_weaknesses_user ON user_weaknesses(user_id);
CREATE INDEX idx_quiz_sessions_user ON quiz_sessions(user_id);

-- Row Level Security (RLS) Policies

-- Enable RLS on all tables
ALTER TABLE subjects ENABLE ROW LEVEL SECURITY;
ALTER TABLE papers ENABLE ROW LEVEL SECURITY;
ALTER TABLE topics ENABLE ROW LEVEL SECURITY;
ALTER TABLE questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE question_options ENABLE ROW LEVEL SECURITY;
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE ai_explanations ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_weaknesses ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_sessions ENABLE ROW LEVEL SECURITY;

-- Public read access for content tables
CREATE POLICY "Anyone can read subjects" ON subjects FOR SELECT USING (true);
CREATE POLICY "Anyone can read papers" ON papers FOR SELECT USING (true);
CREATE POLICY "Anyone can read topics" ON topics FOR SELECT USING (true);
CREATE POLICY "Anyone can read questions" ON questions FOR SELECT USING (true);
CREATE POLICY "Anyone can read question_options" ON question_options FOR SELECT USING (true);
CREATE POLICY "Anyone can read ai_explanations" ON ai_explanations FOR SELECT USING (true);

-- User-specific policies
CREATE POLICY "Users can read own profile" ON profiles 
    FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Users can update own profile" ON profiles 
    FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "Users can insert own profile" ON profiles 
    FOR INSERT WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can read own attempts" ON attempts 
    FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own attempts" ON attempts 
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can read own weaknesses" ON user_weaknesses 
    FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can manage own weaknesses" ON user_weaknesses 
    FOR ALL USING (auth.uid() = user_id);

CREATE POLICY "Users can read own quiz sessions" ON quiz_sessions 
    FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can manage own quiz sessions" ON quiz_sessions 
    FOR ALL USING (auth.uid() = user_id);

-- Function to handle new user signup
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.profiles (id, email, name)
    VALUES (NEW.id, NEW.email, COALESCE(NEW.raw_user_meta_data->>'name', ''));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger to create profile on signup
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- Function to update user_weaknesses
CREATE OR REPLACE FUNCTION update_user_weakness()
RETURNS TRIGGER AS $$
DECLARE
    topic_tag TEXT;
    topic_record RECORD;
BEGIN
    -- For each topic tag in the question
    FOREACH topic_tag IN ARRAY (
        SELECT topic_tags FROM questions WHERE id = NEW.question_id
    )
    LOOP
        -- Find the topic
        SELECT id INTO topic_record FROM topics WHERE name_en = topic_tag LIMIT 1;
        
        IF topic_record.id IS NOT NULL THEN
            -- Upsert the weakness record
            INSERT INTO user_weaknesses (user_id, topic_id, accuracy_percentage, total_attempts, last_calculated_at)
            VALUES (
                NEW.user_id,
                topic_record.id,
                CASE WHEN NEW.is_correct THEN 100 ELSE 0 END,
                1,
                NOW()
            )
            ON CONFLICT (user_id, topic_id) DO UPDATE SET
                accuracy_percentage = (
                    (user_weaknesses.accuracy_percentage * user_weaknesses.total_attempts + 
                     CASE WHEN NEW.is_correct THEN 100 ELSE 0 END) / 
                    (user_weaknesses.total_attempts + 1)
                ),
                total_attempts = user_weaknesses.total_attempts + 1,
                last_calculated_at = NOW();
        END IF;
    END LOOP;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger to update weaknesses on new attempt
CREATE TRIGGER on_attempt_created
    AFTER INSERT ON attempts
    FOR EACH ROW EXECUTE FUNCTION update_user_weakness();
