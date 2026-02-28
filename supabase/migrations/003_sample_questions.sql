-- Sample Questions for A/L Study Companion
-- Migration: 003_sample_questions

-- Combined Mathematics 2023 Paper I - Part A Questions
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level, latex_content)
SELECT 
    p.id,
    'part_a',
    1,
    'short_structured',
    'Using the principle of mathematical induction, prove that $6^n - 1$ is divisible by 5 for all positive integers $n$.',
    'ගණිතමය ආගමනය භාවිතයෙන් සියලු ධන පූර්ණ සංඛ්‍යා $n$ සඳහා $6^n - 1$, 5 න් බෙදෙන බව ඔප්පු කරන්න.',
    'Base case n=1: 6^1 - 1 = 5, divisible by 5 ✓
Assume true for n=k: 6^k - 1 = 5m for some integer m
Prove for n=k+1: 6^{k+1} - 1 = 6·6^k - 1 = 6(5m + 1) - 1 = 30m + 5 = 5(6m + 1)
Since 6m + 1 is an integer, 6^{k+1} - 1 is divisible by 5.',
    'Base case (n=1): 5 marks
Inductive hypothesis: 5 marks
Inductive step: 10 marks
Conclusion: 5 marks',
    25,
    true,
    ARRAY['mathematical_induction', 'divisibility'],
    3,
    '6^n - 1 \equiv 0 \pmod{5}'
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'combined_maths' AND p.paper_type = 'paper_1' AND p.year = 2023;

INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level, latex_content)
SELECT 
    p.id,
    'part_a',
    2,
    'short_structured',
    'Find all values of $x$ satisfying the inequality $\frac{x-1}{x+2} \leq \frac{x+3}{x-1}$.',
    '$\frac{x-1}{x+2} \leq \frac{x+3}{x-1}$ අසමානතාව සෘඳ කරන $x$ හි සියලු අගයන් සොයන්න.',
    'Critical points: x = -2, 1
Rearranging: (x-1)² - (x+3)(x+2) ≤ 0
Simplifying: -6x - 5 ≤ 0
x ≥ -5/6
Considering domain restrictions: x ∈ (-2, -5/6] ∪ (1, ∞)',
    'Finding critical points: 5 marks
Rearranging inequality: 8 marks
Sign analysis: 7 marks
Final answer with domain: 5 marks',
    25,
    true,
    ARRAY['polynomial_equations', 'inequalities'],
    4,
    '\frac{x-1}{x+2} \leq \frac{x+3}{x-1}'
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'combined_maths' AND p.paper_type = 'paper_1' AND p.year = 2023;

INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level, latex_content)
SELECT 
    p.id,
    'part_a',
    3,
    'short_structured',
    'Sketch the region in the Argand diagram defined by $|z - 2i| \leq 2$ and $\text{Re}(z) \geq 0$. Find the maximum value of $\text{Re}(z) + \text{Im}(z)$ in this region.',
    'ආර්ගෑන්ඩ් රූප සටහනෙහි $|z - 2i| \leq 2$ සහ $\text{Re}(z) \geq 0$ මගින් නිර්වචනය කරන ප්‍රදේශය අඳින්න. මෙම ප්‍රදේශයේ $\text{Re}(z) + \text{Im}(z)$ හි උපරිම අගය සොයන්න.',
    'Region: Semicircle centered at (0, 2) with radius 2, right half
Maximum occurs at z = √2 + (2+√2)i
Maximum value = √2 + 2 + √2 = 2 + 2√2',
    'Correct sketch: 10 marks
Identifying region: 5 marks
Finding maximum point: 5 marks
Calculating maximum value: 5 marks',
    25,
    true,
    ARRAY['complex_numbers', 'argand_diagram'],
    3,
    '|z - 2i| \leq 2'
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'combined_maths' AND p.paper_type = 'paper_1' AND p.year = 2023;

-- Combined Mathematics Part B Question
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level, has_subparts)
SELECT 
    p.id,
    'part_b',
    1,
    'long_structured',
    '(a) Find $\int \frac{x^2}{(x^2+1)(x^2+4)} dx$
    
(b) Using the substitution $x = 2\tan\theta$, evaluate $\int_0^2 \frac{1}{(4+x^2)^{3/2}} dx$

(c) Find the volume of the solid generated when the region bounded by $y = \sin x$, $y = 0$, $x = 0$, and $x = \pi$ is rotated about the x-axis.',
    '(a) $\int \frac{x^2}{(x^2+1)(x^2+4)} dx$ සොයන්න

(b) $x = 2\tan\theta$ ආදේශය භාවිතයෙන් $\int_0^2 \frac{1}{(4+x^2)^{3/2}} dx$ ගණනය කරන්න

(c) $y = \sin x$, $y = 0$, $x = 0$, සහ $x = \pi$ මගින් සීමාවූ ප්‍රදේශය x-අක්ෂය වටා භ්‍රමණය කරන විට ලැබෙන ඝනයේ පරිමාව සොයන්න.',
    '(a) Using partial fractions: = (1/3)tan⁻¹(x) - (2/3)tan⁻¹(x/2) + C
(b) Result = 1/(4√2)
(c) V = π²/2',
    '(a) Partial fractions: 20 marks, Integration: 30 marks
(b) Substitution: 15 marks, Evaluation: 35 marks
(c) Setup: 20 marks, Integration: 30 marks',
    150,
    false,
    ARRAY['integration', 'volume_of_revolution', 'trigonometric_substitution'],
    5,
    true
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'combined_maths' AND p.paper_type = 'paper_1' AND p.year = 2023;

-- Physics 2023 Paper I - MCQ Questions
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    1,
    'mcq',
    'The dimensions of the gravitational constant G are:',
    'ගුරුත්වාකර්ෂණ නියතය G හි මාන වන්නේ:',
    'A',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['dimensional_analysis', 'gravitation'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'physics' AND p.paper_type = 'paper_1' AND p.year = 2023;

-- Physics MCQ Options
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT 
    q.id,
    'A',
    'M⁻¹L³T⁻²',
    'M⁻¹L³T⁻²',
    true
FROM questions q
JOIN papers p ON q.paper_id = p.id
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'physics' AND p.paper_type = 'paper_1' AND q.question_number = 1;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT 
    q.id,
    'B',
    'ML³T⁻²',
    'ML³T⁻²',
    false
FROM questions q
JOIN papers p ON q.paper_id = p.id
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'physics' AND p.paper_type = 'paper_1' AND q.question_number = 1;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT 
    q.id,
    'C',
    'M⁻¹L²T⁻²',
    'M⁻¹L²T⁻²',
    false
FROM questions q
JOIN papers p ON q.paper_id = p.id
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'physics' AND p.paper_type = 'paper_1' AND q.question_number = 1;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT 
    q.id,
    'D',
    'ML²T⁻²',
    'ML²T⁻²',
    false
FROM questions q
JOIN papers p ON q.paper_id = p.id
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'physics' AND p.paper_type = 'paper_1' AND q.question_number = 1;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT 
    q.id,
    'E',
    'M⁻¹L³T⁻¹',
    'M⁻¹L³T⁻¹',
    false
FROM questions q
JOIN papers p ON q.paper_id = p.id
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'physics' AND p.paper_type = 'paper_1' AND q.question_number = 1;

-- Another Physics MCQ
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    2,
    'mcq',
    'If no net force acts on an object, which of the following statements is true?',
    'වස්තුවක් මත ශුද්ධ බලයක් ක්‍රියා නොකරන්නේ නම්, පහත ප්‍රකාශ වලින් සත්‍ය වන්නේ කුමක්ද?',
    'D',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['mechanics', 'newtons_laws'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'physics' AND p.paper_type = 'paper_1' AND p.year = 2023;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'It must be at rest', 'එය නිශ්චලව තිබිය යුතුය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'physics' AND p.paper_type = 'paper_1' AND q.question_number = 2;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'It must be moving with constant velocity', 'එය නියත ප්‍රවේගයකින් ගමන් කළ යුතුය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'physics' AND p.paper_type = 'paper_1' AND q.question_number = 2;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'It must be accelerating', 'එය ත්වරණය විය යුතුය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'physics' AND p.paper_type = 'paper_1' AND q.question_number = 2;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'It may be at rest or moving with constant velocity', 'එය නිශ්චලව හෝ නියත ප්‍රවේගයකින් ගමන් කරමින් සිටිය හැක', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'physics' AND p.paper_type = 'paper_1' AND q.question_number = 2;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'It must be moving in a circular path', 'එය වෘත්තාකාර මාර්ගයක ගමන් කළ යුතුය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'physics' AND p.paper_type = 'paper_1' AND q.question_number = 2;

-- Chemistry MCQ
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    1,
    'mcq',
    'Which of the following elements has the lowest third ionization energy?',
    'පහත මූලද්‍රව්‍ය වලින් අඩුම තුන්වන අයනීකරණ ශක්තිය ඇත්තේ කුමකටද?',
    'C',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['periodic_table', 'ionization_energy'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Na', 'Na', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND q.question_number = 1;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Mg', 'Mg', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND q.question_number = 1;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Al', 'Al', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND q.question_number = 1;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Si', 'Si', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND q.question_number = 1;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'P', 'P', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND q.question_number = 1;
