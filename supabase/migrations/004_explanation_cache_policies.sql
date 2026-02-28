-- Migration: 004_explanation_cache_policies
-- Adds INSERT and UPDATE RLS policies for ai_explanations to support
-- server-side caching of AI-generated explanations.

-- Allow authenticated users to insert new cached explanations
CREATE POLICY "Authenticated users can insert explanations"
    ON ai_explanations
    FOR INSERT
    WITH CHECK (auth.role() = 'authenticated');

-- Allow authenticated users to update cached explanations (for upsert)
CREATE POLICY "Authenticated users can update explanations"
    ON ai_explanations
    FOR UPDATE
    USING (auth.role() = 'authenticated');

-- Add composite index for cache lookups (question_id + language)
-- The UNIQUE constraint already creates an index, but this makes intent explicit
CREATE INDEX IF NOT EXISTS idx_ai_explanations_cache_key
    ON ai_explanations(question_id, language);
