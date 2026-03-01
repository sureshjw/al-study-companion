-- Chemistry Questions for A/L Study Companion
-- Migration: 008_chemistry_2024_questions
-- Year: 2024 Paper I - Questions 6-50

-- =====================================================
-- Chemistry 2024 Paper I - MCQ Questions 6-20
-- =====================================================

-- Question 6: Periodic trends - Ionization energy
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    6,
    'mcq',
    'Which element shows an anomalous first ionization energy compared to the expected trend across Period 2?',
    '2 වන ආවර්තය හරහා අපේක්ෂිත ප්‍රවණතාවට සාපේක්ෂව විෂමතාවක් පෙන්වන පළමු අයනීකරණ ශක්තිය ඇති මූලද්‍රව්‍යය කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['ionization_energy', 'periodic_trends', 'atomic_structure'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Li', 'Li', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 6
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'B (Boron)', 'B (බෝරෝන්)', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 6
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'C', 'C', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 6
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'N', 'N', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 6
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'F', 'F', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 6
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 7: Molecular shape VSEPR
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    7,
    'mcq',
    'Which molecule has a see-saw (disphenoidal) shape?',
    'කුමන අණුවට see-saw (disphenoidal) හැඩයක් ඇත්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['vsepr_theory', 'molecular_shape', 'hybridization'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'PCl₅', 'PCl₅', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 7
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'BrF₃', 'BrF₃', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 7
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'SF₄', 'SF₄', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 7
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'XeF₄', 'XeF₄', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 7
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'ClF₃', 'ClF₃', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 7
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 8: Hess's law calculation
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    8,
    'mcq',
    'Given: C(s) + O₂(g) → CO₂(g), ΔH = -394 kJ mol⁻¹; CO(g) + ½O₂(g) → CO₂(g), ΔH = -283 kJ mol⁻¹. What is ΔH for C(s) + ½O₂(g) → CO(g)?',
    'ලබා දී ඇත: C(s) + O₂(g) → CO₂(g), ΔH = -394 kJ mol⁻¹; CO(g) + ½O₂(g) → CO₂(g), ΔH = -283 kJ mol⁻¹. C(s) + ½O₂(g) → CO(g) සඳහා ΔH කුමක්ද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['hess_law', 'enthalpy_change', 'thermochemistry'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '-111 kJ mol⁻¹', '-111 kJ mol⁻¹', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 8
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '+111 kJ mol⁻¹', '+111 kJ mol⁻¹', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 8
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '-677 kJ mol⁻¹', '-677 kJ mol⁻¹', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 8
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '+677 kJ mol⁻¹', '+677 kJ mol⁻¹', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 8
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '-283 kJ mol⁻¹', '-283 kJ mol⁻¹', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 8
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 9: Redox reactions
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    9,
    'mcq',
    'In the reaction: 2Fe³⁺ + Sn²⁺ → 2Fe²⁺ + Sn⁴⁺, which statement is correct?',
    '2Fe³⁺ + Sn²⁺ → 2Fe²⁺ + Sn⁴⁺ ප්‍රතික්‍රියාවේ දී, නිවැරදි ප්‍රකාශය කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['redox_reactions', 'oxidation_reduction', 'electron_transfer'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Fe³⁺ is oxidized', 'Fe³⁺ ඔක්සිකරණය වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 9
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Sn²⁺ is reduced', 'Sn²⁺ අවකරණය වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 9
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Fe³⁺ is the oxidizing agent', 'Fe³⁺ ඔක්සිකාරකය වේ', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 9
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Sn²⁺ is the oxidizing agent', 'Sn²⁺ ඔක්සිකාරකය වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 9
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'No electron transfer occurs', 'ඉලෙක්ට්‍රෝන හුවමාරුවක් සිදු නොවේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 9
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 10: Organic reaction mechanism
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    10,
    'mcq',
    'Which reaction follows SN1 mechanism?',
    'කුමන ප්‍රතික්‍රියාව SN1 යාන්ත්‍රණය අනුගමනය කරයිද?',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['reaction_mechanism', 'sn1_sn2', 'organic_reactions'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'CH₃Br + OH⁻ → CH₃OH + Br⁻', 'CH₃Br + OH⁻ → CH₃OH + Br⁻', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 10
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'CH₃CH₂Br + OH⁻ → CH₃CH₂OH + Br⁻', 'CH₃CH₂Br + OH⁻ → CH₃CH₂OH + Br⁻', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 10
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'CH₃CH₂CH₂Br + OH⁻ → CH₃CH₂CH₂OH + Br⁻', 'CH₃CH₂CH₂Br + OH⁻ → CH₃CH₂CH₂OH + Br⁻', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 10
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '(CH₃)₃CBr + OH⁻ → (CH₃)₃COH + Br⁻', '(CH₃)₃CBr + OH⁻ → (CH₃)₃COH + Br⁻', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 10
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'All follow SN1 mechanism', 'සියල්ල SN1 යාන්ත්‍රණය අනුගමනය කරයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 10
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 11: Acid strength comparison
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    11,
    'mcq',
    'Arrange the following in order of increasing acid strength: HF, HCl, HBr, HI',
    'පහත සඳහන් දෑ වැඩිවන අම්ල ශක්තිය අනුපිළිවෙලට සකසන්න: HF, HCl, HBr, HI',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['acid_strength', 'halogen_acids', 'periodic_trends'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'HI < HBr < HCl < HF', 'HI < HBr < HCl < HF', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 11
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'HF < HCl < HBr < HI', 'HF < HCl < HBr < HI', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 11
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'HCl < HF < HBr < HI', 'HCl < HF < HBr < HI', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 11
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'All have equal acid strength', 'සියල්ලටම සමාන අම්ල ශක්තිය ඇත', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 11
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'HBr < HI < HCl < HF', 'HBr < HI < HCl < HF', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 11
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 12: Electrochemical cell
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    12,
    'mcq',
    'In an electrochemical cell, which statement about the anode is correct?',
    'විද්‍යුත් රසායනික කෝෂයක දී, ඇනෝඩය ගැන නිවැරදි ප්‍රකාශය කුමක්ද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['electrochemistry', 'galvanic_cell', 'electrode_reactions'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Oxidation occurs at the anode', 'ඇනෝඩයේ දී ඔක්සිකරණය සිදු වේ', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 12
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Reduction occurs at the anode', 'ඇනෝඩයේ දී අවකරණය සිදු වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 12
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Anode is always positive in all cells', 'සියලුම කෝෂ වල ඇනෝඩය සැමවිටම ධන වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 12
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Electrons flow towards the anode', 'ඉලෙක්ට්‍රෝන ඇනෝඩය දෙසට ගලා යයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 12
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Cations move towards the anode', 'කැටායන ඇනෝඩය දෙසට ගමන් කරයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 12
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 13: Equilibrium constant expression
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    13,
    'mcq',
    'For the equilibrium: 2NO₂(g) ⇌ N₂O₄(g), Kp = 8.0 atm⁻¹ at 25°C. What is the unit of Kc?',
    '2NO₂(g) ⇌ N₂O₄(g) සමතුලිතාවය සඳහා, 25°C දී Kp = 8.0 atm⁻¹. Kc හි ඒකකය කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['equilibrium_constant', 'kp_kc_relationship', 'chemical_equilibrium'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'No units (dimensionless)', 'ඒකක නොමැත (මාන රහිත)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 13
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'dm³ mol⁻¹', 'dm³ mol⁻¹', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 13
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'mol dm⁻³', 'mol dm⁻³', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 13
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'atm', 'atm', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 13
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'mol² dm⁻⁶', 'mol² dm⁻⁶', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 13
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 14: Carbohydrate chemistry
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    14,
    'mcq',
    'Which statement about glucose is correct?',
    'ග්ලූකෝස් ගැන නිවැරදි ප්‍රකාශය කුමක්ද?',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['carbohydrates', 'glucose', 'biochemistry'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Glucose is a disaccharide', 'ග්ලූකෝස් ද්විශර්කරාවක් වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 14
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Glucose does not reduce Fehling solution', 'ග්ලූකෝස් ෆේලිං ද්‍රාවණය අවකරණය නොකරයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 14
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Glucose has the molecular formula C₁₂H₂₂O₁₁', 'ග්ලූකෝස් වල අණුක සූත්‍රය C₁₂H₂₂O₁₁ වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 14
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Glucose exists as α and β anomers', 'ග්ලූකෝස් α සහ β ඇනොමර ලෙස පවතී', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 14
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Glucose is a ketose sugar', 'ග්ලූකෝස් කීටෝස් සීනියක් වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 14
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 15: Rate determining step
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    15,
    'mcq',
    'A reaction has the mechanism: Step 1: A + B → C (slow); Step 2: C + D → E (fast). What is the rate law?',
    'ප්‍රතික්‍රියාවක යාන්ත්‍රණය: පියවර 1: A + B → C (මන්දගාමී); පියවර 2: C + D → E (වේගවත්). වේග නියමය කුමක්ද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['reaction_kinetics', 'rate_determining_step', 'mechanism'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Rate = k[A][B]', 'වේගය = k[A][B]', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 15
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Rate = k[C][D]', 'වේගය = k[C][D]', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 15
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Rate = k[A][B][D]', 'වේගය = k[A][B][D]', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 15
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Rate = k[A][B][C][D]', 'වේගය = k[A][B][C][D]', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 15
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Rate = k[E]', 'වේගය = k[E]', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 15
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 16: Atomic radius trend
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    16,
    'mcq',
    'Which correctly shows decreasing atomic radius?',
    'අඩු වන පරමාණුක අරය නිවැරදිව පෙන්වන්නේ කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['atomic_radius', 'periodic_trends', 'atomic_structure'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Li > Be > B > C > N', 'Li > Be > B > C > N', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 16
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'N > C > B > Be > Li', 'N > C > B > Be > Li', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 16
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Na > Mg > Al > Si > P', 'Na > Mg > Al > Si > P', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 16
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'F > Cl > Br > I', 'F > Cl > Br > I', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 16
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Ca > K > Na > Li', 'Ca > K > Na > Li', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 16
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 17: Amide hydrolysis
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    17,
    'mcq',
    'What are the products when ethanamide (acetamide) is hydrolyzed with dilute HCl?',
    'එතනමයිඩ් (ඇසිටමයිඩ්) ක්ෂීණ HCl සමඟ ජලවිච්ඡේදනය කළ විට නිෂ්පාදන මොනවාද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['amides', 'hydrolysis', 'organic_reactions'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Ethanoic acid and ammonia', 'එතනොයික් අම්ලය සහ ඇමෝනියා', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 17
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Ethanoic acid and ammonium chloride', 'එතනොයික් අම්ලය සහ ඇමෝනියම් ක්ලෝරයිඩ්', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 17
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Sodium ethanoate and ammonia', 'සෝඩියම් එතනොයේට් සහ ඇමෝනියා', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 17
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Ethanol and ammonium chloride', 'එතනෝල් සහ ඇමෝනියම් ක්ලෝරයිඩ්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 17
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Ethanal and ammonium chloride', 'එතනාල් සහ ඇමෝනියම් ක්ලෝරයිඩ්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 17
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 18: Solubility product
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    18,
    'mcq',
    'The Ksp of AgCl at 25°C is 1.8 × 10⁻¹⁰. What is the solubility of AgCl in mol dm⁻³?',
    '25°C දී AgCl හි Ksp = 1.8 × 10⁻¹⁰ වේ. mol dm⁻³ වලින් AgCl ද්‍රාව්‍යතාව කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['solubility_product', 'ionic_equilibrium', 'ksp_calculations'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '1.8 × 10⁻¹⁰', '1.8 × 10⁻¹⁰', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 18
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '9.0 × 10⁻⁶', '9.0 × 10⁻⁶', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 18
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '1.34 × 10⁻⁵', '1.34 × 10⁻⁵', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 18
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '3.6 × 10⁻²⁰', '3.6 × 10⁻²⁰', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 18
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '4.2 × 10⁻⁴', '4.2 × 10⁻⁴', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 18
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 19: Arrhenius equation
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    19,
    'mcq',
    'According to the Arrhenius equation k = Ae⁻Ea/RT, a plot of ln k against 1/T gives:',
    'ආරේනියස් සමීකරණය k = Ae⁻Ea/RT අනුව, 1/T ට එරෙහිව ln k ප්‍රස්තාරය ලබා දෙන්නේ:',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['arrhenius_equation', 'activation_energy', 'reaction_kinetics'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'A straight line with positive slope', 'ධන බෑවුමක් සහිත සරල රේඛාවක්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 19
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'A straight line with negative slope', 'සෘණ බෑවුමක් සහිත සරල රේඛාවක්', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 19
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'A parabola', 'පැරබලාවක්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 19
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'An exponential curve', 'ඝාතීය වක්‍රයක්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 19
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'A horizontal line', 'තිරස් රේඛාවක්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 19
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 20: Benzene reactions
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    20,
    'mcq',
    'When benzene reacts with chlorine in the presence of UV light, what is the product?',
    'බෙන්සීන් UV ආලෝකය ඉදිරියේ ක්ලෝරීන් සමඟ ප්‍රතික්‍රියා කරන විට, නිෂ්පාදනය කුමක්ද?',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['benzene_reactions', 'halogenation', 'aromatic_chemistry'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Chlorobenzene', 'ක්ලෝරොබෙන්සීන්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 20
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '1,2-Dichlorobenzene', '1,2-ඩයික්ලෝරොබෙන්සීන්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 20
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Benzyl chloride', 'බෙන්සිල් ක්ලෝරයිඩ්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 20
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Hexachlorocyclohexane (BHC)', 'හෙක්සාක්ලෝරොසයික්ලොහෙක්සේන් (BHC)', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 20
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Phenol', 'ෆීනෝල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 20
ON CONFLICT (question_id, option_label) DO NOTHING;
