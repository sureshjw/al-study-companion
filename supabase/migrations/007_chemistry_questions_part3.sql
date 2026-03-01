-- Chemistry Questions Part 3 for A/L Study Companion
-- Migration: 007_chemistry_questions_part3
-- Years: 2023 Paper I - Questions 31-50

-- =====================================================
-- Chemistry 2023 Paper I - MCQ Questions 31-40
-- =====================================================

-- Question 31: Organic structure and reactivity
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    31,
    'mcq',
    'Compound X (C₅H₁₂O) does not give positive test with Lucas reagent at room temperature but reacts on heating. X on oxidation gives Y which gives positive Tollens test. What is X?',
    'X සංයෝගය (C₅H₁₂O) කාමර උෂ්ණත්වයේ දී ලූකස් ප්‍රතිකාරකය සමඟ ධන පරීක්ෂණයක් ලබා නොදෙන නමුත් උණු කිරීමේ දී ප්‍රතික්‍රියා කරයි. X ඔක්සිකරණයේ දී Y ලබා දෙන අතර එය ධන ටොලන්ස් පරීක්ෂණයක් ලබා දෙයි. X කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['alcohols', 'organic_reactions', 'functional_group_tests'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '3-Methylbutan-2-ol', '3-මෙතිල්බියුටන්-2-ඔල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 31
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '2-Methylbutan-1-ol', '2-මෙතිල්බියුටන්-1-ඔල්', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 31
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '2,2-Dimethylpropan-1-ol', '2,2-ඩයිමෙතිල්ප්‍රොපෙන්-1-ඔල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 31
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Pentan-2-ol', 'පෙන්ටන්-2-ඔල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 31
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Pentan-3-ol', 'පෙන්ටන්-3-ඔල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 31
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 32: Aromatic electrophilic substitution
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    32,
    'mcq',
    'In electrophilic substitution of benzene, which pair shows ortho/para directing and ring deactivating?',
    'බෙන්සීන් හි ඉලෙක්ට්‍රෝෆිලික් ආදේශනයේ දී, ඕතෝ/පැරා යොමු කරන සහ වළල්ල අක්‍රිය කරන යුගලය කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['aromatic_chemistry', 'electrophilic_substitution', 'directing_effects'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '-OH, -NH₂', '-OH, -NH₂', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 32
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '-CH₃, -Cl', '-CH₃, -Cl', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 32
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '-Cl, -Br', '-Cl, -Br', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 32
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '-NO₂, -COOH', '-NO₂, -COOH', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 32
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '-OCH₃, -NHCOCH₃', '-OCH₃, -NHCOCH₃', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 32
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 33: Lattice energy and ionic radius
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    33,
    'mcq',
    'Consider alkali metal halides: LiF, LiCl, LiBr, LiI. What is the correct order of lattice energies (highest to lowest)?',
    'ක්ෂාර ලෝහ හේලයිඩ සලකන්න: LiF, LiCl, LiBr, LiI. ජාලක ශක්තීන්ගේ නිවැරදි අනුපිළිවෙල (ඉහළම සිට පහළම) කුමක්ද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['ionic_bonding', 'lattice_energy', 'periodic_trends'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'LiF > LiCl > LiBr > LiI', 'LiF > LiCl > LiBr > LiI', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 33
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'LiI > LiBr > LiCl > LiF', 'LiI > LiBr > LiCl > LiF', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 33
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'LiCl > LiF > LiBr > LiI', 'LiCl > LiF > LiBr > LiI', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 33
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'All have equal lattice energies', 'සියල්ලටම සමාන ජාලක ශක්ති ඇත', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 33
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'LiBr > LiCl > LiF > LiI', 'LiBr > LiCl > LiF > LiI', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 33
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 34: Polymer identification
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    34,
    'mcq',
    'Which polymer is correctly matched with its monomer(s)?',
    'කුමන බහුඅවයවය එහි ඒකඑක(ය) සමඟ නිවැරදිව ගැලපේද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['polymers', 'organic_chemistry', 'condensation_polymerization'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Nylon 6,6 - Adipic acid only', 'නයිලෝන් 6,6 - ඇඩිපික් අම්ලය පමණි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 34
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Polyester (PET) - Ethylene glycol only', 'පොලිඑස්ටර් (PET) - එතිලීන් ග්ලයිකෝල් පමණි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 34
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Nylon 6,6 - Adipic acid and hexamethylenediamine', 'නයිලෝන් 6,6 - ඇඩිපික් අම්ලය සහ හෙක්සමෙතිලීන්ඩයඇමීන්', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 34
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Polystyrene - Styrene and ethylene', 'පොලිස්ටයිරීන් - ස්ටයිරීන් සහ එතිලීන්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 34
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'PVC - Vinyl chloride and vinyl acetate', 'PVC - වයිනිල් ක්ලෝරයිඩ් සහ වයිනිල් ඇසිටේට්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 34
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 35: pH calculation
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    35,
    'mcq',
    'What is the pH of a solution prepared by mixing 50.0 cm³ of 0.10 mol dm⁻³ HCl with 50.0 cm³ of 0.10 mol dm⁻³ NaOH?',
    '0.10 mol dm⁻³ HCl 50.0 cm³ සමඟ 0.10 mol dm⁻³ NaOH 50.0 cm³ මිශ්‍ර කිරීමෙන් සකසන ද්‍රාවණයේ pH කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['ph_calculations', 'acid_base_chemistry', 'neutralization'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '0', '0', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 35
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '1', '1', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 35
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '7', '7', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 35
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '13', '13', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 35
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '14', '14', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 35
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 36: Coordination compounds - isomerism
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    36,
    'mcq',
    '[Co(NH₃)₄Cl₂]⁺ can exhibit which type of isomerism?',
    '[Co(NH₃)₄Cl₂]⁺ කුමන වර්ගයේ සමාවයවිකතාවක් දැක්විය හැකිද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['coordination_compounds', 'isomerism', 'd_block'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Optical isomerism only', 'ප්‍රකාශ සමාවයවිකතාව පමණි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 36
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Geometrical isomerism (cis-trans)', 'ජ්‍යාමිතික සමාවයවිකතාව (සිස්-ට්‍රාන්ස්)', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 36
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Linkage isomerism', 'සම්බන්ධන සමාවයවිකතාව', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 36
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Ionization isomerism', 'අයනීකරණ සමාවයවිකතාව', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 36
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'No isomerism possible', 'සමාවයවිකතාවක් ඇති කළ නොහැක', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 36
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 37: Rate law determination
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    37,
    'mcq',
    'For a reaction A + 2B → Products, when [A] is doubled at constant [B], rate doubles. When [B] is doubled at constant [A], rate quadruples. What is the rate law?',
    'A + 2B → නිෂ්පාදන ප්‍රතික්‍රියාව සඳහා, නියත [B] දී [A] දෙගුණ කළ විට වේගය දෙගුණ වේ. නියත [A] දී [B] දෙගුණ කළ විට වේගය සතරගුණ වේ. වේග නියමය කුමක්ද?',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['reaction_kinetics', 'rate_law', 'order_of_reaction'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Rate = k[A][B]', 'වේගය = k[A][B]', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 37
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Rate = k[A]²[B]', 'වේගය = k[A]²[B]', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 37
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Rate = k[A][B]³', 'වේගය = k[A][B]³', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 37
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Rate = k[A][B]²', 'වේගය = k[A][B]²', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 37
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Rate = k[A]²[B]²', 'වේගය = k[A]²[B]²', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 37
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 38: Electronegativity and bond polarity
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    38,
    'mcq',
    'Which molecule has the highest dipole moment?',
    'ඉහළම ද්විධ්‍රැව ඝ‍ූර්ණය ඇති අණුව කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['bond_polarity', 'electronegativity', 'molecular_properties'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'CO₂', 'CO₂', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 38
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'CCl₄', 'CCl₄', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 38
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'HF', 'HF', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 38
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'CH₄', 'CH₄', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 38
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'BF₃', 'BF₃', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 38
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 39: Amino acid properties
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    39,
    'mcq',
    'At the isoelectric point of an amino acid, which statement is correct?',
    'ඇමයිනෝ අම්ලයක සමවිද්‍යුත් ලක්ෂ්‍යයේ දී, නිවැරදි ප්‍රකාශය කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['amino_acids', 'isoelectric_point', 'biochemistry'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'The amino acid carries net positive charge', 'ඇමයිනෝ අම්ලය ශුද්ධ ධන ආරෝපණයක් දරයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 39
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'The amino acid exists as zwitterion with no net charge', 'ඇමයිනෝ අම්ලය ශුද්ධ ආරෝපණයක් නැති ස්විටර් අයනයක් ලෙස පවතී', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 39
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'The amino acid carries net negative charge', 'ඇමයිනෝ අම්ලය ශුද්ධ සෘණ ආරෝපණයක් දරයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 39
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'The amino acid is completely unionized', 'ඇමයිනෝ අම්ලය සම්පූර්ණයෙන්ම අයනීකරණය නොවී ඇත', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 39
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'The amino acid moves towards the anode in electrophoresis', 'ඇමයිනෝ අම්ලය විද්‍යුත් චලනයේ දී ධන ධ්‍රුවය දෙසට ගමන් කරයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 39
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 40: Radioactive decay
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    40,
    'mcq',
    'A radioactive isotope has a half-life of 10 days. What fraction of the original sample remains after 30 days?',
    'විකිරණශීලී සමස්ථානිකයකට දින 10 අර්ධ ආයු කාලයක් ඇත. දින 30 කට පසු මුල් සාම්පලයෙන් කොපමණ කොටසක් ඉතිරි වේද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['radioactivity', 'half_life', 'nuclear_chemistry'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '1/4', '1/4', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 40
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '1/8', '1/8', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 40
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '1/3', '1/3', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 40
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '1/16', '1/16', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 40
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '1/2', '1/2', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 40
ON CONFLICT (question_id, option_label) DO NOTHING;

-- =====================================================
-- Chemistry 2023 Paper I - MCQ Questions 41-50
-- =====================================================

-- Question 41: Isomerism - structural
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    41,
    'mcq',
    'How many structural isomers exist for C₄H₈O that contain a carbonyl group?',
    'කාබනයිල් කාණ්ඩයක් අඩංගු C₄H₈O සඳහා ව්‍යුහාත්මක සමාවයවික කීයක් පවතීද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['isomerism', 'structural_isomers', 'organic_chemistry'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '2', '2', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 41
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '3', '3', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 41
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '4', '4', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 41
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '5', '5', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 41
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '6', '6', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 41
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 42: Group II compounds
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    42,
    'mcq',
    'Which statement about Group II (alkaline earth metals) is correct?',
    'II කාණ්ඩය (ක්ෂාරීය පාංශු ලෝහ) ගැන නිවැරදි ප්‍රකාශය කුමක්ද?',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['s_block', 'group_ii', 'periodic_table'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'All Group II hydroxides are equally soluble', 'සියලුම II කාණ්ඩ හයිඩ්‍රොක්සයිඩ සමානව ද්‍රාව්‍ය වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 42
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'All Group II carbonates decompose at the same temperature', 'සියලුම II කාණ්ඩ කාබනේට් එකම උෂ්ණත්වයේ දී විඝටනය වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 42
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Mg(OH)₂ is more soluble than Ba(OH)₂', 'Mg(OH)₂, Ba(OH)₂ ට වඩා ද්‍රාව්‍ය වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 42
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Thermal stability of carbonates increases down the group', 'කාබනේට් වල තාප ස්ථායිතාව කාණ්ඩයේ පහළට වැඩි වේ', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 42
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Solubility of sulfates increases down the group', 'සල්ෆේට් වල ද්‍රාව්‍යතාව කාණ්ඩයේ පහළට වැඩි වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 42
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 43: Ester hydrolysis
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    43,
    'mcq',
    'What are the products when ethyl ethanoate (ethyl acetate) is hydrolyzed with dilute NaOH?',
    'එතිල් එතනොයේට් (එතිල් ඇසිටේට්) ක්ෂීණ NaOH සමඟ ජලවිච්ඡේදනය කළ විට නිෂ්පාදන මොනවාද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['esters', 'hydrolysis', 'organic_reactions'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Ethanol and sodium ethanoate', 'එතනෝල් සහ සෝඩියම් එතනොයේට්', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 43
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Ethanol and ethanoic acid', 'එතනෝල් සහ එතනොයික් අම්ලය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 43
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Sodium ethoxide and ethanoic acid', 'සෝඩියම් එතොක්සයිඩ් සහ එතනොයික් අම්ලය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 43
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Ethanal and sodium ethanoate', 'එතනාල් සහ සෝඩියම් එතනොයේට්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 43
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Methanol and sodium propanoate', 'මෙතනෝල් සහ සෝඩියම් ප්‍රොපනොයේට්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 43
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 44: Covalent bonding - molecular orbital theory
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    44,
    'mcq',
    'According to molecular orbital theory, what is the bond order of O₂?',
    'අණුක කක්ෂික න්‍යාය අනුව, O₂ හි බන්ධන ක්‍රමය කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['molecular_orbital_theory', 'bond_order', 'covalent_bonding'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '1', '1', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 44
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '2', '2', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 44
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '2.5', '2.5', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 44
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '3', '3', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 44
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '1.5', '1.5', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 44
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 45: Colligative properties
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    45,
    'mcq',
    'Which aqueous solution has the highest boiling point? (All solutions have the same molality)',
    'ඉහළම තාපාංකය ඇති ජලීය ද්‍රාවණය කුමක්ද? (සියලුම ද්‍රාවණ වලට සමාන මවුලාලිටි ඇත)',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['colligative_properties', 'boiling_point_elevation', 'solutions'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Glucose (C₆H₁₂O₆)', 'ග්ලූකෝස් (C₆H₁₂O₆)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 45
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'NaCl', 'NaCl', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 45
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'MgCl₂', 'MgCl₂', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 45
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Al₂(SO₄)₃', 'Al₂(SO₄)₃', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 45
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Urea (CO(NH₂)₂)', 'යූරියා (CO(NH₂)₂)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 45
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 46: Functional group identification
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    46,
    'mcq',
    'A compound gives positive test with FeCl₃ solution (purple color). Which functional group is present?',
    'සංයෝගයක් FeCl₃ ද්‍රාවණය සමඟ ධන පරීක්ෂණයක් (දම් පැහැය) ලබා දෙයි. කුමන ක්‍රියාකාරී කාණ්ඩය පවතීද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['functional_group_tests', 'phenols', 'organic_chemistry'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Primary alcohol', 'ප්‍රාථමික ඇල්කොහොල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 46
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Phenol', 'ෆීනෝල්', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 46
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Aldehyde', 'ඇල්ඩිහයිඩ්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 46
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Carboxylic acid', 'කාබොක්සිලික් අම්ලය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 46
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Ether', 'ඊතර්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 46
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 47: Nitrogen compounds
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    47,
    'mcq',
    'Which statement about ammonia (NH₃) is correct?',
    'ඇමෝනියා (NH₃) ගැන නිවැරදි ප්‍රකාශය කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['ammonia', 'nitrogen_compounds', 'molecular_shape'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'NH₃ has a planar structure', 'NH₃ සමතල ව්‍යුහයක් ඇත', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 47
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'NH₃ has bond angle of 109.5°', 'NH₃ හි බන්ධන කෝණය 109.5° වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 47
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'NH₃ acts as a Lewis base by donating lone pair', 'NH₃ තනි යුගලයක් ප්‍රදානය කිරීමෙන් ලුවිස් භෂ්මයක් ලෙස ක්‍රියා කරයි', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 47
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'NH₃ cannot form hydrogen bonds', 'NH₃ හයිඩ්‍රජන් බන්ධන සෑදිය නොහැක', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 47
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'N in NH₃ is sp² hybridized', 'NH₃ හි N sp² සංකරිත වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 47
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 48: Born-Haber cycle
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    48,
    'mcq',
    'Using Born-Haber cycle, which enthalpy change represents the formation of gaseous Na⁺ ion from solid sodium?',
    'බොන්-හේබර් චක්‍රය භාවිතා කරමින්, ඝන සෝඩියම් වලින් වායුමය Na⁺ අයනය සෑදීම නිරූපණය කරන එන්තැල්පි වෙනස කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['born_haber_cycle', 'lattice_energy', 'thermodynamics'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Ionization energy only', 'අයනීකරණ ශක්තිය පමණි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 48
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Atomization energy only', 'පරමාණුකරණ ශක්තිය පමණි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 48
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Atomization energy + ionization energy', 'පරමාණුකරණ ශක්තිය + අයනීකරණ ශක්තිය', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 48
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Lattice energy', 'ජාලක ශක්තිය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 48
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Electron affinity', 'ඉලෙක්ට්‍රෝන ඇලීම', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 48
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 49: Elimination vs substitution
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    49,
    'mcq',
    '2-Bromobutane is treated with hot concentrated alcoholic KOH. What is the major product?',
    '2-බ්‍රෝමොබියුටේන් උණුසුම් සාන්ද්‍ර ඇල්කොහොලික KOH සමඟ ප්‍රතිකාර කරයි. ප්‍රධාන නිෂ්පාදනය කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['elimination_reactions', 'alkene_formation', 'organic_reactions'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'But-1-ene', 'බියුට්-1-ඊන්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 49
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'But-2-ene', 'බියුට්-2-ඊන්', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 49
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Butan-2-ol', 'බියුටන්-2-ඔල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 49
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Butane', 'බියුටේන්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 49
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Butanal', 'බියුටනාල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 49
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 50: Entropy change
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    50,
    'mcq',
    'For which process is ΔS positive?',
    'කුමන ක්‍රියාවලිය සඳහා ΔS ධන වේද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['entropy', 'thermodynamics', 'spontaneity'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'H₂O(l) → H₂O(g)', 'H₂O(l) → H₂O(g)', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 50
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'N₂(g) + 3H₂(g) → 2NH₃(g)', 'N₂(g) + 3H₂(g) → 2NH₃(g)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 50
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'H₂O(g) → H₂O(l)', 'H₂O(g) → H₂O(l)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 50
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'CO₂(g) → CO₂(s)', 'CO₂(g) → CO₂(s)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 50
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'NaCl(aq) → NaCl(s)', 'NaCl(aq) → NaCl(s)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 50
ON CONFLICT (question_id, option_label) DO NOTHING;
