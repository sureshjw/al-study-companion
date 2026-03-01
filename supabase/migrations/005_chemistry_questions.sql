-- Chemistry Questions for A/L Study Companion
-- Migration: 005_chemistry_questions
-- Years: 2023, 2024
-- Uses ON CONFLICT DO NOTHING to avoid duplicate key errors

-- =====================================================
-- First, ensure Chemistry 2024 papers exist
-- =====================================================

INSERT INTO papers (subject_id, paper_type, year, total_marks, raw_marks, description, duration_minutes)
SELECT 
    (SELECT id FROM subjects WHERE code = 'chemistry'),
    'paper_1',
    2024,
    50,
    50,
    'Chemistry Paper I - Multiple Choice Questions (2024)',
    120
WHERE NOT EXISTS (
    SELECT 1 FROM papers p
    JOIN subjects s ON p.subject_id = s.id
    WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
);

INSERT INTO papers (subject_id, paper_type, year, total_marks, raw_marks, description, duration_minutes)
SELECT 
    (SELECT id FROM subjects WHERE code = 'chemistry'),
    'paper_2',
    2024,
    100,
    1000,
    'Chemistry Paper II - Structured Questions (2024)',
    180
WHERE NOT EXISTS (
    SELECT 1 FROM papers p
    JOIN subjects s ON p.subject_id = s.id
    WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2024
);

-- =====================================================
-- Chemistry 2023 Paper I - MCQ Questions (Part A)
-- Question 1 exists in 003_sample_questions.sql
-- =====================================================

-- Question 2: Hydrogen emission spectrum transitions
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level, latex_content)
SELECT 
    p.id,
    'part_a',
    2,
    'mcq',
    'Which pair of electron transitions in a hydrogen atom would produce electromagnetic radiation of the shortest wavelength?',
    'හයිඩ්‍රජන් පරමාණුවක ඉලෙක්ට්‍රෝන සංක්‍රාන්ති වලින් කුමන යුගලයක් කෙටිම තරංග ආයාමයක විද්‍යුත් චුම්භක විකිරණ නිපදවයිද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['atomic_structure', 'emission_spectrum', 'bohr_model'],
    3,
    NULL
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'n=3→n=1, n=2→n=1', 'n=3→n=1, n=2→n=1', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 2
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'n=3→n=1, n=4→n=3', 'n=3→n=1, n=4→n=3', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 2
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'n=2→n=1, n=4→n=3', 'n=2→n=1, n=4→n=3', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 2
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'n=3→n=1, n=3→n=2', 'n=3→n=1, n=3→n=2', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 2
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'n=2→n=1, n=3→n=2', 'n=2→n=1, n=3→n=2', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 2
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 3: Thermal decomposition of Group II carbonates
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    3,
    'mcq',
    'When Group II metal carbonates decompose according to MCO₃(s) → MO(s) + CO₂(g), which carbonate requires the highest temperature for decomposition?',
    'II වන කාණ්ඩයේ ලෝහ කාබනේට MCO₃(s) → MO(s) + CO₂(g) අනුව විඝටනය වන විට, විඝටනය සඳහා ඉහළම උෂ්ණත්වය අවශ්‍ය කාබනේටය කුමක්ද?',
    '5',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['group_ii_elements', 'thermal_decomposition', 's_block'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'BeCO₃', 'BeCO₃', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 3
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'MgCO₃', 'MgCO₃', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 3
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'CaCO₃', 'CaCO₃', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 3
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'SrCO₃', 'SrCO₃', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 3
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'BaCO₃', 'BaCO₃', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 3
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 4: Hybridization
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    4,
    'mcq',
    'Consider the molecules F₂ClO⁺, F₂BrO⁺, and F₃ClO⁺. The correct order of hybridization of the central atoms is:',
    'F₂ClO⁺, F₂BrO⁺, සහ F₃ClO⁺ අණු සලකන්න. මධ්‍ය පරමාණුවල සංකරණයේ නිවැරදි අනුපිළිවෙල වන්නේ:',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['hybridization', 'molecular_geometry', 'chemical_bonding'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'sp³, sp³d, sp³ respectively', 'පිළිවෙලින් sp³, sp³d, sp³', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 4
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'sp³d, sp³, sp³d² respectively', 'පිළිවෙලින් sp³d, sp³, sp³d²', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 4
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'sp³, sp³d, sp³d² respectively', 'පිළිවෙලින් sp³, sp³d, sp³d²', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 4
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'sp³d, sp³, sp³d respectively', 'පිළිවෙලින් sp³d, sp³, sp³d', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 4
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'sp³d, sp³, sp³d³ respectively', 'පිළිවෙලින් sp³d, sp³, sp³d³', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 4
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 5: IUPAC Nomenclature
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level, latex_content)
SELECT 
    p.id,
    'part_a',
    5,
    'mcq',
    'What is the IUPAC name of the following compound? HO-CH(CH₃)-CO-CH(NH₂)-CH=CH₂',
    'පහත සංයෝගයේ IUPAC නාමය කුමක්ද? HO-CH(CH₃)-CO-CH(NH₂)-CH=CH₂',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['organic_nomenclature', 'iupac_naming', 'functional_groups'],
    3,
    NULL
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '4-amino-3-oxohex-5-en-2-ol', '4-amino-3-oxohex-5-en-2-ol', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 5
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '5-hydroxy-4-oxohex-1-en-3-amine', '5-hydroxy-4-oxohex-1-en-3-amine', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 5
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '3-amino-5-hydroxyhex-1-en-4-one', '3-amino-5-hydroxyhex-1-en-4-one', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 5
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '4-amino-2-hydroxyhex-5-en-3-one', '4-amino-2-hydroxyhex-5-en-3-one', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 5
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '3-amino-5-hydroxy-4-oxohex-1-ene', '3-amino-5-hydroxy-4-oxohex-1-ene', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 5
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 6: Solubility product (Ksp)
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    6,
    'mcq',
    'The solubility products (Ksp) of four sparingly soluble salts are given below. Which salt has the highest molar solubility?
    A: PbCl₂ → Ksp = 5.00 × 10⁻⁷ mol³ dm⁻⁹
    B: CuCl → Ksp = 1.60 × 10⁻⁷ mol² dm⁻⁶
    C: AgCl → Ksp = 1.60 × 10⁻¹⁰ mol² dm⁻⁶
    D: Hg₂Cl₂ → Ksp = 1.08 × 10⁻¹⁶ mol³ dm⁻⁹',
    'අඩු ද්‍රාව්‍යතාවයක් ඇති ලවණ හතරක ද්‍රාව්‍යතා ගුණිතය (Ksp) පහත දැක්වේ. ඉහළම මවුලික ද්‍රාව්‍යතාවයක් ඇති ලවණය කුමක්ද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['solubility_product', 'ionic_equilibrium', 'ksp'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'A < B < C < D', 'A < B < C < D', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 6
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'B < A < C < D', 'B < A < C < D', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 6
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'A < B < D < C', 'A < B < D < C', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 6
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'D < C < B < A', 'D < C < B < A', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 6
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'D < C < A < B', 'D < C < A < B', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 6
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 7: Periodic trends
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    7,
    'mcq',
    'Which of the following statements about periodic properties is correct?',
    'ආවර්තිත ගුණ පිළිබඳ පහත ප්‍රකාශ වලින් නිවැරදි වන්නේ කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['periodic_table', 'periodic_trends', 'ionic_radius'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Ionization energy increases down a group', 'කාණ්ඩයක පහළට යන විට අයනීකරණ ශක්තිය වැඩි වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 7
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'He has the highest second ionization energy among noble gases', 'උතුම් වායු අතර He හි දෙවන අයනීකරණ ශක්තිය ඉහළම වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 7
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Na⁺ has a smaller ionic radius than Li', 'Na⁺ හි අයනික අරය Li ට වඩා කුඩා වේ', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 7
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Among LiI, KF and KI, KF has the lowest lattice energy', 'LiI, KF සහ KI අතර KF හි ජාලක ශක්තිය අඩුම වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 7
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Xe has a larger atomic radius than Se', 'Xe හි පරමාණුක අරය Se ට වඩා විශාල වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 7
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 8: Electronegativity
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    8,
    'mcq',
    'Arrange the following in increasing order of electronegativity of the underlined carbon atom: CH₃CH₂Br, CH₂=CHF, CH₂=CHCl, HC≡CF',
    'යටි ඉරි සහිත කාබන් පරමාණුවේ විද්‍යුත් ඍණතාවය වැඩි වන පිළිවෙලට අනුක්‍රමය කරන්න: CH₃CH₂Br, CH₂=CHF, CH₂=CHCl, HC≡CF',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['electronegativity', 'hybridization', 'chemical_bonding'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'CH₃CH₂Br < CH₂=CHF < CH₂=CHCl < HC≡CF', 'CH₃CH₂Br < CH₂=CHF < CH₂=CHCl < HC≡CF', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 8
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'HC≡CF < CH₂=CHCl < CH₂=CHF < CH₃CH₂Br', 'HC≡CF < CH₂=CHCl < CH₂=CHF < CH₃CH₂Br', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 8
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'CH₂=CHF < CH₂=CHCl < CH₃CH₂Br < HC≡CF', 'CH₂=CHF < CH₂=CHCl < CH₃CH₂Br < HC≡CF', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 8
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'CH₃CH₂Br < CH₂=CHCl < CH₂=CHF < HC≡CF', 'CH₃CH₂Br < CH₂=CHCl < CH₂=CHF < HC≡CF', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 8
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'CH₃CH₂Br < CH₂=CHF < HC≡CF < CH₂=CHCl', 'CH₃CH₂Br < CH₂=CHF < HC≡CF < CH₂=CHCl', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 8
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 9: Free radical reactions
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    9,
    'mcq',
    'Which of the following represents a propagation step in the free radical chlorination of methane?',
    'මීතේන් වල නිදහස් රැඩිකල් ක්ලෝරීනකරණයේ ප්‍රචාරණ පියවරක් නිරූපණය කරන්නේ කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['organic_reactions', 'free_radical', 'halogenation'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'CHCl₃ + Cl• → CH₂Cl₂ + H•', 'CHCl₃ + Cl• → CH₂Cl₂ + H•', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 9
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'CH₃Cl₂ + Cl• → CHCl₂• + HCl', 'CH₃Cl₂ + Cl• → CHCl₂• + HCl', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 9
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'CH₄ + Cl• → CH₃Cl', 'CH₄ + Cl• → CH₃Cl', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 9
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'CHCl₃ + Cl• → CCl₄ + HCl', 'CHCl₃ + Cl• → CCl₄ + HCl', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 9
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Cl• + Cl• → Cl₂', 'Cl• + Cl• → Cl₂', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 9
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 10: Reaction kinetics
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    10,
    'mcq',
    'For the reaction A₂ + B₂ → A₂B₂, the rate equation is Rate = k[A₂]. Three possible mechanisms are proposed. Which mechanism(s) can produce this rate equation?',
    'A₂ + B₂ → A₂B₂ ප්‍රතික්‍රියාව සඳහා වේග සමීකරණය Rate = k[A₂] වේ. යෝජිත යාන්ත්‍රණ තුනකින් කුමක්/කුමන ඒවා මෙම වේග සමීකරණය ලබා දිය හැකිද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['reaction_kinetics', 'rate_equations', 'reaction_mechanisms'],
    5
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Mechanism I and II can produce this rate equation', 'යාන්ත්‍රණ I සහ II මෙම වේග සමීකරණය ලබා දිය හැක', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 10
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Mechanism II and III can produce this rate equation', 'යාන්ත්‍රණ II සහ III මෙම වේග සමීකරණය ලබා දිය හැක', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 10
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Mechanism I and III can produce this rate equation', 'යාන්ත්‍රණ I සහ III මෙම වේග සමීකරණය ලබා දිය හැක', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 10
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'All three mechanisms can produce this rate equation', 'යාන්ත්‍රණ තුනම මෙම වේග සමීකරණය ලබා දිය හැක', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 10
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'None of the mechanisms can produce this rate equation', 'කිසිදු යාන්ත්‍රණයකින් මෙම වේග සමීකරණය ලබා දිය නොහැක', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 10
ON CONFLICT (question_id, option_label) DO NOTHING;

-- =====================================================
-- Chemistry 2024 Paper I - MCQ Questions (Part A)
-- =====================================================

-- Question 1: Intermolecular forces
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    1,
    'mcq',
    'Which gas can be most easily liquefied by applying pressure at room temperature?',
    'කාමර උෂ්ණත්වයේ දී පීඩනය යෙදීමෙන් වඩාත් පහසුවෙන් ද්‍රවණය කළ හැකි වායුව කුමක්ද?',
    '5',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['intermolecular_forces', 'liquefaction', 'gas_laws'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'He', 'He', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 1
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Ne', 'Ne', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 1
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'CH₄', 'CH₄', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 1
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'N₂', 'N₂', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 1
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'CO', 'CO', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 1
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 2: Electron configuration
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    2,
    'mcq',
    'An element X has the electronic configuration shown. Which configuration correctly shows X in an excited state?',
    'X මූලද්‍රව්‍යයක ඉලෙක්ට්‍රෝන වින්‍යාසය දක්වා ඇත. X උද්දීපිත තත්ත්වයේ නිවැරදි වින්‍යාසය කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['electron_configuration', 'atomic_structure', 'excited_states'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '2s² 2p⁰', '2s² 2p⁰', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 2
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '2s¹ 2p¹', '2s¹ 2p¹', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 2
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '2s² 2p³', '2s² 2p³', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 2
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '2s² 2p²', '2s² 2p²', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 2
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '2s¹ 2p³', '2s¹ 2p³', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 2
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 3: Quantum numbers
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    3,
    'mcq',
    'How many electrons in an atom can have n=3, ml=-1 or n=4, ml=-1?',
    'පරමාණුවක n=3, ml=-1 හෝ n=4, ml=-1 විය හැකි ඉලෙක්ට්‍රෝන ගණන කීයද?',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['quantum_numbers', 'atomic_orbitals', 'electron_configuration'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '2', '2', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 3
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '3', '3', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 3
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '4', '4', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 3
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '5', '5', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 3
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '6', '6', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 3
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 4: De Broglie wavelength
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    4,
    'mcq',
    'X and Y are two particles with de Broglie wavelengths of 1 nm and 3 nm respectively. If X has a mass that is Y''s mass divided by a certain factor, what is the ratio of their momenta (X:Y)?',
    'X සහ Y අංශු දෙකක de Broglie තරංග ආයාම පිළිවෙලින් 1 nm සහ 3 nm වේ. X හි ස්කන්ධය Y ස්කන්ධයෙන් යම් සාධකයකින් බෙදූ අගය නම්, ඔවුන්ගේ ගම්‍ය අනුපාතය (X:Y) කුමක්ද?',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['de_broglie_wavelength', 'quantum_mechanics', 'momentum'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '1 : 4', '1 : 4', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 4
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '1 : 3', '1 : 3', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 4
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '3 : 4', '3 : 4', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 4
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '3 : 1', '3 : 1', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 4
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '4 : 1', '4 : 1', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 4
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 5: IUPAC naming 2024
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    5,
    'mcq',
    'What is the IUPAC name of the compound: Cl-CH₂-CH(OH)-CH(NH₂)-CH₃?',
    'Cl-CH₂-CH(OH)-CH(NH₂)-CH₃ සංයෝගයේ IUPAC නාමය කුමක්ද?',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['organic_nomenclature', 'iupac_naming', 'functional_groups'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '2-amino-5-chloro-3-pentanol', '2-amino-5-chloro-3-pentanol', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 5
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '4-amino-1-chloro-3-pentanol', '4-amino-1-chloro-3-pentanol', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 5
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '5-chloro-3-hydroxy-2-pentanamine', '5-chloro-3-hydroxy-2-pentanamine', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 5
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '1-chloro-3-hydroxy-4-pentanamine', '1-chloro-3-hydroxy-4-pentanamine', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 5
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '2-amino-5-chloro-3-hydroxypentane', '2-amino-5-chloro-3-hydroxypentane', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 5
ON CONFLICT (question_id, option_label) DO NOTHING;

-- =====================================================
-- Add Chemistry topics for proper categorization
-- =====================================================

INSERT INTO topics (subject_id, name_en, name_si, syllabus_reference)
SELECT s.id, 'Quantum Mechanics', 'ක්වොන්ටම් යාන්ත්‍ර විද්‍යාව', 'Unit 1.2'
FROM subjects s WHERE s.code = 'chemistry'
ON CONFLICT DO NOTHING;

INSERT INTO topics (subject_id, name_en, name_si, syllabus_reference)
SELECT s.id, 'Thermodynamics', 'තාප ගතිකය', 'Unit 4'
FROM subjects s WHERE s.code = 'chemistry'
ON CONFLICT DO NOTHING;

INSERT INTO topics (subject_id, name_en, name_si, syllabus_reference)
SELECT s.id, 'Reaction Kinetics', 'ප්‍රතික්‍රියා ගතිකය', 'Unit 6'
FROM subjects s WHERE s.code = 'chemistry'
ON CONFLICT DO NOTHING;

INSERT INTO topics (subject_id, name_en, name_si, syllabus_reference)
SELECT s.id, 'Environmental Chemistry', 'පාරිසරික රසායනය', 'Unit 11'
FROM subjects s WHERE s.code = 'chemistry'
ON CONFLICT DO NOTHING;
