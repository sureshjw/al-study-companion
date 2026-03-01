-- Chemistry Questions Part 2 for A/L Study Companion
-- Migration: 006_chemistry_questions_part2
-- Years: 2023, 2024 - Questions 11-30 for Paper I

-- =====================================================
-- Chemistry 2023 Paper I - MCQ Questions 11-20
-- =====================================================

-- Question 11: Thermal decomposition of ammonium salts
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    11,
    'mcq',
    'Consider the thermal decomposition of the following ammonium salts: NH₄F, NH₄NO₂, NH₄NO₃, (NH₄)₂CO₃, and (NH₄)₂Cr₂O₇. Which statement is correct about the gaseous products?',
    'පහත ඇමෝනියම් ලවණවල තාප විඝටනය සලකන්න: NH₄F, NH₄NO₂, NH₄NO₃, (NH₄)₂CO₃, සහ (NH₄)₂Cr₂O₇. වායුමය නිෂ්පාදන ගැන නිවැරදි ප්‍රකාශය කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['thermal_decomposition', 'ammonium_salts', 's_block'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'All five salts produce NH₃ gas', 'ලවණ පහම NH₃ වායුව නිපදවයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 11
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'All five salts produce N₂ gas', 'ලවණ පහම N₂ වායුව නිපදවයි', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 11
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Only three salts produce oxidizing gases', 'ලවණ තුනක් පමණක් ඔක්සිකාරක වායු නිපදවයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 11
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Two salts produce the same type of products', 'ලවණ දෙකක් එකම වර්ගයේ නිෂ්පාදන ලබා දෙයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 11
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'All five salts produce H₂O', 'ලවණ පහම H₂O නිපදවයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 11
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 12: Acid-base titration curve
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    12,
    'mcq',
    'A weak acid is titrated with NaOH. From the titration curve shown, which statement is correct about the equivalence point?',
    'දුර්වල අම්ලයක් NaOH සමඟ අනුමාපනය කරයි. පෙන්වා ඇති අනුමාපන වක්‍රයෙන්, සමතුල්‍ය ලක්ෂ්‍යය ගැන නිවැරදි ප්‍රකාශය කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['acid_base_titration', 'titration_curves', 'equivalence_point'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'At equivalence point, pH equals pKa of the weak acid', 'සමතුල්‍ය ලක්ෂ්‍යයේ දී pH = දුර්වල අම්ලයේ pKa', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 12
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'At half-equivalence point, pH equals pKa of the weak acid', 'අර්ධ-සමතුල්‍ය ලක්ෂ්‍යයේ දී pH = දුර්වල අම්ලයේ pKa', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 12
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'At equivalence point, [H⁺] = [OH⁻]', 'සමතුල්‍ය ලක්ෂ්‍යයේ දී [H⁺] = [OH⁻]', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 12
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'The same indicator is suitable for all weak acid-strong base titrations', 'සියලුම දුර්වල අම්ල-ශක්තිමත් භෂ්ම අනුමාපනවලට එකම දර්ශකය සුදුසු වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 12
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'pH at equivalence point equals pH of NaOH solution added', 'සමතුල්‍ය ලක්ෂ්‍යයේ pH = එකතු කළ NaOH ද්‍රාවණයේ pH', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 12
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 13: Carbonyl compound reactions
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    13,
    'mcq',
    'Compound A gives a positive test with 2,4-dinitrophenylhydrazine (2,4-DNP). A reacts with acidified K₂Cr₂O₇ to give B. B also gives positive test with 2,4-DNP but does not give silver mirror test with AgNO₃. What is A?',
    'A සංයෝගය 2,4-DNP සමඟ ධන පරීක්ෂණයක් ලබා දෙයි. A අම්ලකෘත K₂Cr₂O₇ සමඟ ප්‍රතික්‍රියා කර B ලබා දෙයි. B ද 2,4-DNP සමඟ ධන පරීක්ෂණයක් ලබා දෙන නමුත් AgNO₃ සමඟ රිදී දර්පණ පරීක්ෂණය ලබා නොදේ. A කුමක්ද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['organic_reactions', 'carbonyl_compounds', 'functional_group_tests'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'CH₃CO-CH₂CH₂CH(OH)CH₃ (Secondary alcohol with ketone)', 'CH₃CO-CH₂CH₂CH(OH)CH₃ (කීටෝන් සහිත ද්විතීයික ඇල්කොහොල්)', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 13
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'CH₃CH(OH)CH₂CHO (Aldehyde with secondary alcohol)', 'CH₃CH(OH)CH₂CHO (ද්විතීයික ඇල්කොහොල් සහිත ඇල්ඩිහයිඩ්)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 13
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'HOCH-CH₂-CH₂-CH₂-CHO (Dialdehyde)', 'HOCH-CH₂-CH₂-CH₂-CHO (ඩයිඇල්ඩිහයිඩ්)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 13
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'HOCH-CH₂-CH₂-CH₂-CH₂OH (Diol)', 'HOCH-CH₂-CH₂-CH₂-CH₂OH (ඩයෝල්)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 13
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'HOCH-CH₂-CH₂-CH₂-CH₂OH (Pentanediol)', 'HOCH-CH₂-CH₂-CH₂-CH₂OH (පෙන්ටේන්ඩයෝල්)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 13
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 14: Acid-base calculation
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    14,
    'mcq',
    'What volume of 5.0 mol dm⁻³ H₂SO₄ is required to completely neutralize 20.0 cm³ of 30% NaOH solution with density 1.4 g cm⁻³? (H = 1, O = 16, Na = 23)',
    'ඝනත්වය 1.4 g cm⁻³ වන 30% NaOH ද්‍රාවණය 20.0 cm³ සම්පූර්ණයෙන් උදාසීන කිරීමට 5.0 mol dm⁻³ H₂SO₄ කොපමණ පරිමාවක් අවශ්‍යද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['acid_base_titration', 'stoichiometry', 'concentration'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '15.0 cm³', '15.0 cm³', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 14
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '21.0 cm³', '21.0 cm³', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 14
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '30.0 cm³', '30.0 cm³', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 14
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '42.0 cm³', '42.0 cm³', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 14
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '84.0 cm³', '84.0 cm³', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 14
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 15: Ideal gas mixture
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    15,
    'mcq',
    'A mixture of He and Ne gases at pressure P is in a container. If the partial pressure of He is given, what is the ratio of moles of He to Ne? (He = 4, Ne = 20)',
    'P පීඩනයක් ඇති He සහ Ne වායු මිශ්‍රණයක් භාජනයක ඇත. He හි අර්ධ පීඩනය ලබා දී ඇත්නම්, He සිට Ne මවුල අනුපාතය කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['ideal_gas', 'dalton_law', 'partial_pressure'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'P', 'P', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 15
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '5P', '5P', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 15
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '6P/5', '6P/5', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 15
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '2P', '2P', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 15
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'P/6', 'P/6', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 15
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 16: Chemical equilibrium
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    16,
    'mcq',
    'For the equilibrium H₂(g) + I₂(g) ⇌ 2HI(g), if I₂(g) is added to a system at equilibrium in a closed vessel, which statement is correct?',
    'H₂(g) + I₂(g) ⇌ 2HI(g) සමතුලිතාවය සඳහා, සමතුලිතතාවයේ පවතින වසා ඇති භාජනයකට I₂(g) එකතු කළහොත්, නිවැරදි ප්‍රකාශය කුමක්ද?',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['chemical_equilibrium', 'le_chatelier_principle', 'equilibrium_constant'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Both H₂ and I₂ concentrations increase', 'H₂ සහ I₂ යන දෙකෙහිම සාන්ද්‍රණය වැඩි වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 16
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Both H₂ and I₂ concentrations decrease', 'H₂ සහ I₂ යන දෙකෙහිම සාන්ද්‍රණය අඩු වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 16
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Both concentrations remain unchanged', 'දෙකෙහිම සාන්ද්‍රණය නොවෙනස්ව පවතී', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 16
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'H₂ decreases, I₂ increases compared to initial equilibrium', 'H₂ අඩු වී, I₂ ආරම්භක සමතුලිතාවයට සාපේක්ෂව වැඩි වේ', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 16
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'H₂ increases, I₂ decreases compared to initial equilibrium', 'H₂ වැඩි වී, I₂ ආරම්භක සමතුලිතාවයට සාපේක්ෂව අඩු වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 16
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 17: Buffer solutions
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    17,
    'mcq',
    'A buffer solution is prepared by mixing 100.0 cm³ of 1.0 mol dm⁻³ CH₃COOH and 100.0 cm³ of 1.0 mol dm⁻³ CH₃COONa. The pH at 25°C is 4.8. What reaction mainly maintains pH when dilute HCl is added?',
    '1.0 mol dm⁻³ CH₃COOH 100.0 cm³ සහ 1.0 mol dm⁻³ CH₃COONa 100.0 cm³ මිශ්‍ර කිරීමෙන් ගේන්දර ද්‍රාවණයක් සකසා ඇත. ක්ෂීණ HCl එකතු කරන විට pH පවත්වා ගැනීමට ප්‍රධාන ප්‍රතික්‍රියාව කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['buffer_solutions', 'ph_calculations', 'acid_base_chemistry'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'H₃O⁺ + OH⁻ → 2H₂O', 'H₃O⁺ + OH⁻ → 2H₂O', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 17
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'H₃O⁺ + CH₃COO⁻ → CH₃COOH + H₂O', 'H₃O⁺ + CH₃COO⁻ → CH₃COOH + H₂O', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 17
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'H₃O⁺ + Cl⁻ → HCl + H₂O', 'H₃O⁺ + Cl⁻ → HCl + H₂O', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 17
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'H₃O⁺ + CH₃COOH → CH₃COOH₂⁺ + H₂O', 'H₃O⁺ + CH₃COOH → CH₃COOH₂⁺ + H₂O', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 17
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'CH₃COOH + OH⁻ → CH₃COO⁻ + H₂O', 'CH₃COOH + OH⁻ → CH₃COO⁻ + H₂O', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 17
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 18: Bond energy and enthalpy
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    18,
    'mcq',
    'Bond energies of H-H, Cl-Cl, and H-Cl are 430, 240, and 430 kJ mol⁻¹ respectively. Which diagram correctly represents H₂(g) + Cl₂(g) → 2HCl(g)?',
    'H-H, Cl-Cl, සහ H-Cl වල බන්ධන ශක්ති පිළිවෙලින් 430, 240, සහ 430 kJ mol⁻¹ වේ. H₂(g) + Cl₂(g) → 2HCl(g) නිවැරදිව නිරූපණය කරන රූප සටහන කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['bond_energy', 'enthalpy_change', 'thermochemistry'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Endothermic with ΔH = +190 kJ mol⁻¹', 'ΔH = +190 kJ mol⁻¹ සහිත එන්ඩොතර්මික්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 18
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Endothermic with ΔH = +240 kJ mol⁻¹', 'ΔH = +240 kJ mol⁻¹ සහිත එන්ඩොතර්මික්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 18
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Exothermic with ΔH = -190 kJ mol⁻¹', 'ΔH = -190 kJ mol⁻¹ සහිත එක්සොතර්මික්', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 18
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Exothermic with ΔH = -240 kJ mol⁻¹', 'ΔH = -240 kJ mol⁻¹ සහිත එක්සොතර්මික්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 18
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Exothermic with ΔH = -430 kJ mol⁻¹', 'ΔH = -430 kJ mol⁻¹ සහිත එක්සොතර්මික්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 18
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 19: Gibbs free energy
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    19,
    'mcq',
    'Given reactions at temperature T, calculate ΔG for NH₃(g) + 2O₂(g) → HNO₃(aq) + H₂O(l)',
    'T උෂ්ණත්වයේ දී ලබා දී ඇති ප්‍රතික්‍රියා වලින්, NH₃(g) + 2O₂(g) → HNO₃(aq) + H₂O(l) සඳහා ΔG ගණනය කරන්න.',
    '5',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['gibbs_free_energy', 'thermodynamics', 'hess_law'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '-1320 kJ mol⁻¹', '-1320 kJ mol⁻¹', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 19
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '-1250 kJ mol⁻¹', '-1250 kJ mol⁻¹', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 19
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '-1110 kJ mol⁻¹', '-1110 kJ mol⁻¹', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 19
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '-580 kJ mol⁻¹', '-580 kJ mol⁻¹', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 19
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '-330 kJ mol⁻¹', '-330 kJ mol⁻¹', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 19
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 20: Organic reactions - LiAlH4/PCl3/NaBH4
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    20,
    'mcq',
    'Which compound will undergo all three reactions: (I) Reduction with PCl₅, (II) Reaction with dilute NaOH, (III) Reduction with LiAlH₄?',
    'පහත ප්‍රතික්‍රියා තුනම සිදු කරන සංයෝගය කුමක්ද: (I) PCl₅ සමඟ ඔක්සිකරණය, (II) ක්ෂීණ NaOH සමඟ ප්‍රතික්‍රියාව, (III) LiAlH₄ සමඟ අවකරණය?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['organic_reactions', 'reduction', 'functional_groups'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'CH₃-CO-CH₂-CO-NH₂', 'CH₃-CO-CH₂-CO-NH₂', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 20
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'CH₃-CH(OH)-CH₂-CHO', 'CH₃-CH(OH)-CH₂-CHO', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 20
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'H-C(CH₃)(OH)-CO-OH', 'H-C(CH₃)(OH)-CO-OH', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 20
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'CH₃-C(CH₃)(NH₂)-CH₂-CO-CH₃', 'CH₃-C(CH₃)(NH₂)-CH₂-CO-CH₃', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 20
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'CH₃-CO-CH₃', 'CH₃-CO-CH₃', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 20
ON CONFLICT (question_id, option_label) DO NOTHING;

-- =====================================================
-- Chemistry 2023 Paper I - MCQ Questions 21-30
-- =====================================================

-- Question 21: Equilibrium constant manipulation
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    21,
    'mcq',
    'For the equilibrium: FeF₂(s) + 2H⁺(aq) ⇌ Fe²⁺(aq) + 2HF(aq), given K₁ and K₂, what can be said about the overall K?',
    'FeF₂(s) + 2H⁺(aq) ⇌ Fe²⁺(aq) + 2HF(aq) සමතුලිතාවය සඳහා, K₁ සහ K₂ ලබා දී ඇත්නම්, සමස්ත K ගැන කුමක් කිව හැකිද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['equilibrium_constant', 'chemical_equilibrium', 'calculations'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'K₂ > 1 favors product formation', 'K₂ > 1 නිෂ්පාදන සෑදීමට අනුග්‍රහය දක්වයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 21
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'K₁ < 1 favors reactant formation', 'K₁ < 1 ප්‍රතික්‍රියක සෑදීමට අනුග්‍රහය දක්වයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 21
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'K > 1 indicates forward reaction is favorable', 'K > 1 ඉදිරි ප්‍රතික්‍රියාව අනුග්‍රහශීලී බව පෙන්වයි', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 21
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'K < 1 indicates reverse reaction is favorable', 'K < 1 ප්‍රතිවර්ත ප්‍රතික්‍රියාව අනුග්‍රහශීලී බව පෙන්වයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 21
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Cannot determine without actual values', 'සත්‍ය අගයන් නොමැතිව තීරණය කළ නොහැක', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 21
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 22: Transition metal chemistry
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    22,
    'mcq',
    'Which statement about transition metal compounds is correct?',
    'සංක්‍රාන්ති ලෝහ සංයෝග ගැන නිවැරදි ප්‍රකාශය කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['transition_metals', 'd_block', 'coordination_compounds'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'NaBH₄ reduces carbonyl compounds to hydrocarbons', 'NaBH₄ කාබනයිල් සංයෝග හයිඩ්‍රොකාබන බවට අවකරණය කරයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 22
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Transition metals show variable oxidation states', 'සංක්‍රාන්ති ලෝහ විචල්‍ය ඔක්සිකරණ අවස්ථා පෙන්වයි', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 22
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'All transition metal compounds are colored', 'සියලුම සංක්‍රාන්ති ලෝහ සංයෝග වර්ණවත් වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 22
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Transition metals cannot form complex ions', 'සංක්‍රාන්ති ලෝහ සංකීර්ණ අයන සෑදිය නොහැක', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 22
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Transition metal oxides are all basic', 'සියලුම සංක්‍රාන්ති ලෝහ ඔක්සයිඩ භෂ්මික වේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 22
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 23: Le Chatelier's principle with methanol
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    23,
    'mcq',
    'For the reaction CH₃OH(g) ⇌ CO(g) + 2H₂(g), ΔH = 91 kJ mol⁻¹, which conditions favor forward reaction?',
    'CH₃OH(g) ⇌ CO(g) + 2H₂(g), ΔH = 91 kJ mol⁻¹ ප්‍රතික්‍රියාව සඳහා, ඉදිරි ප්‍රතික්‍රියාවට අනුග්‍රහය දක්වන කොන්දේසි මොනවාද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['le_chatelier_principle', 'chemical_equilibrium', 'industrial_chemistry'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Low temperature, high pressure', 'අඩු උෂ්ණත්වය, ඉහළ පීඩනය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 23
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'High temperature, low pressure', 'ඉහළ උෂ්ණත්වය, අඩු පීඩනය', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 23
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'High temperature, high pressure', 'ඉහළ උෂ්ණත්වය, ඉහළ පීඩනය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 23
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Low temperature, low pressure', 'අඩු උෂ්ණත්වය, අඩු පීඩනය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 23
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Temperature and pressure have no effect', 'උෂ්ණත්වය සහ පීඩනය බලපෑමක් නැත', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 23
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 24: Ideal gas law
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    24,
    'mcq',
    'An ideal gas at T°C and pressure P₁ occupies 2.0 dm³. If the volume is changed to 5.0 dm³ at the same temperature, what is the new pressure P₂?',
    'T°C සහ P₁ පීඩනයේ දී පරිපූර්ණ වායුවක් 2.0 dm³ ක් අත්පත් කර ගනී. එකම උෂ්ණත්වයේ දී පරිමාව 5.0 dm³ බවට වෙනස් කළහොත්, නව පීඩනය P₂ කුමක්ද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['ideal_gas', 'gas_laws', 'boyles_law'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'P₂ = 0.4P₁', 'P₂ = 0.4P₁', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 24
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'P₂ = 2.5P₁', 'P₂ = 2.5P₁', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 24
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'P₂ = 0.4P₁ (isothermal)', 'P₂ = 0.4P₁ (සමෝෂ්ණ)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 24
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'P₂ = 2.5P₁ (isobaric)', 'P₂ = 2.5P₁ (සම පීඩන)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 24
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'P₂ = 2.5P₁ (at constant T)', 'P₂ = 2.5P₁ (නියත T දී)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 24
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 25: Catalysis
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    25,
    'mcq',
    'For the catalytic reaction: N₂O(g) + CO(g) → N₂(g) + CO₂(g) with Pd catalyst, which statement is correct?',
    'Pd උත්ප්‍රේරක සහිත N₂O(g) + CO(g) → N₂(g) + CO₂(g) උත්ප්‍රේරක ප්‍රතික්‍රියාව සඳහා, නිවැරදි ප්‍රකාශය කුමක්ද?',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['catalysis', 'reaction_kinetics', 'activation_energy'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Pd catalyst increases the activation energy', 'Pd උත්ප්‍රේරකය සක්‍රියකරණ ශක්තිය වැඩි කරයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 25
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Pd catalyst decreases the equilibrium constant', 'Pd උත්ප්‍රේරකය සමතුලිත නියතය අඩු කරයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 25
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Pd catalyst provides an alternative pathway with lower activation energy', 'Pd උත්ප්‍රේරකය අඩු සක්‍රියකරණ ශක්තියක් සහිත විකල්ප මාර්ගයක් සපයයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 25
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Pd catalyst provides an alternative pathway without changing activation energy', 'Pd උත්ප්‍රේරකය සක්‍රියකරණ ශක්තිය වෙනස් නොකර විකල්ප මාර්ගයක් සපයයි', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 25
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Catalyst adsorbs on Pd surface and increases reaction rate', 'උත්ප්‍රේරකය Pd පෘෂ්ඨයේ අවශෝෂණය වී ප්‍රතික්‍රියා වේගය වැඩි කරයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 25
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 26: Fermentation
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    26,
    'mcq',
    'In the fermentation of glucose to produce ethanol (C₂H₅OH) and CO₂, how many moles of CO₂ are produced per mole of glucose?',
    'ග්ලූකෝස් ඊතනෝල් (C₂H₅OH) සහ CO₂ බවට පැසවීමේ දී, ග්ලූකෝස් මවුලයකට CO₂ මවුල කීයක් නිපදවේද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['fermentation', 'organic_chemistry', 'stoichiometry'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '4', '4', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 26
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '2', '2', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 26
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '7', '7', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 26
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '10', '10', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 26
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '12', '12', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 26
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 27: Alkyne reactions
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    27,
    'mcq',
    'An alkyne reacts with H₂SO₄/HgSO₄ to give a product. What is the likely product if the starting alkyne has the structure CH₃-C≡C-CH(CH₃)-CH₂OH?',
    'ඇල්කයින් එකක් H₂SO₄/HgSO₄ සමඟ ප්‍රතික්‍රියා කර නිෂ්පාදනයක් ලබා දෙයි. ආරම්භක ඇල්කයින් CH₃-C≡C-CH(CH₃)-CH₂OH ව්‍යුහය ඇත්නම්, ඉඩ ඇති නිෂ්පාදනය කුමක්ද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['alkyne_reactions', 'hydration', 'organic_chemistry'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'CH₃-CO-CH₂-CH(CH₃)-CH₂OH (Ketone)', 'CH₃-CO-CH₂-CH(CH₃)-CH₂OH (කීටෝන්)', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 27
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'CH₃-CH(OH)-CH₂-CH(CH₃)-CH₂OH (Diol)', 'CH₃-CH(OH)-CH₂-CH(CH₃)-CH₂OH (ඩයෝල්)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 27
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'CH₃-CHO (Aldehyde)', 'CH₃-CHO (ඇල්ඩිහයිඩ්)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 27
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'CH₃-CH₂-CO-CH(CH₃)-CH₂OH (Different ketone)', 'CH₃-CH₂-CO-CH(CH₃)-CH₂OH (වෙනත් කීටෝන්)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 27
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'CH₃-CH(OH)-CH=C(CH₃)-CH₂OH (Enol)', 'CH₃-CH(OH)-CH=C(CH₃)-CH₂OH (ඊනෝල්)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 27
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 28: Electrochemistry - Standard cell potential
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    28,
    'mcq',
    'Given at 298 K: Mg²⁺/Mg E° = -2.37 V, Cr³⁺/Cr E° = -0.74 V. What is the correct cell reaction and E°cell?',
    '298 K දී: Mg²⁺/Mg E° = -2.37 V, Cr³⁺/Cr E° = -0.74 V. නිවැරදි කෝෂ ප්‍රතික්‍රියාව සහ E°cell කුමක්ද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['electrochemistry', 'cell_potential', 'redox_reactions'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '2Cr³⁺ + 3Mg → 2Cr + 3Mg²⁺, E°cell = 1.63 V', '2Cr³⁺ + 3Mg → 2Cr + 3Mg²⁺, E°cell = 1.63 V', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 28
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '3Mg²⁺ + 2Cr³⁺ → 3Mg + 2Cr, E°cell = 1.63 V', '3Mg²⁺ + 2Cr³⁺ → 3Mg + 2Cr, E°cell = 1.63 V', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 28
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '3Mg²⁺ + 2Cr → 3Mg + 2Cr³⁺, E°cell = 5.63 V', '3Mg²⁺ + 2Cr → 3Mg + 2Cr³⁺, E°cell = 5.63 V', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 28
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '3Mg²⁺ + 2Cr → 3Mg + 2Cr³⁺, E°cell = 1.63 V', '3Mg²⁺ + 2Cr → 3Mg + 2Cr³⁺, E°cell = 1.63 V', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 28
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '2Cr³⁺ + 3Mg → 2Cr + 3Mg²⁺, E°cell = -1.63 V', '2Cr³⁺ + 3Mg → 2Cr + 3Mg²⁺, E°cell = -1.63 V', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 28
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 29: Limiting reagent
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    29,
    'mcq',
    'TiCl₄ is produced by: TiO₂ + Cl₂ + C → TiCl₄ + CO₂. If 160g TiO₂, 213g Cl₂, 60g C react, what mass of TiCl₄ forms? (C=12, O=16, Cl=35.5, Ti=48)',
    'TiCl₄ මෙසේ නිපදවයි: TiO₂ + Cl₂ + C → TiCl₄ + CO₂. 160g TiO₂, 213g Cl₂, 60g C ප්‍රතික්‍රියා කළහොත් කොපමණ TiCl₄ ස්කන්ධයක් සෑදේද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['stoichiometry', 'limiting_reagent', 'chemical_calculations'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '190 g', '190 g', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 29
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '285 g', '285 g', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 29
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '380 g', '380 g', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 29
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '570 g', '570 g', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 29
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '950 g', '950 g', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 29
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 30: Equilibrium constant Qc vs Kc
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    30,
    'mcq',
    'For PCl₃(g) + Cl₂(g) ⇌ PCl₅(g), Kc = 6.5 mol⁻¹dm³. With initial PCl₃=1.5mol, Cl₂=1.0mol, PCl₅=2.5mol in 1.0dm³, which direction does reaction proceed?',
    'PCl₃(g) + Cl₂(g) ⇌ PCl₅(g) සඳහා Kc = 6.5 mol⁻¹dm³. ආරම්භක PCl₃=1.5mol, Cl₂=1.0mol, PCl₅=2.5mol 1.0dm³ හි නම්, ප්‍රතික්‍රියාව කුමන දිශාවට ගමන් කරයිද?',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['chemical_equilibrium', 'equilibrium_constant', 'reaction_quotient'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Qc < Kc, forward reaction', 'Qc < Kc, ඉදිරි ප්‍රතික්‍රියාව', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 30
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Qc > Kc, forward reaction', 'Qc > Kc, ඉදිරි ප්‍රතික්‍රියාව', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 30
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Qc < Kc, reverse reaction', 'Qc < Kc, ප්‍රතිවර්ත ප්‍රතික්‍රියාව', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 30
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Qc > Kc, reverse reaction', 'Qc > Kc, ප්‍රතිවර්ත ප්‍රතික්‍රියාව', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 30
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Qc = Kc, at equilibrium', 'Qc = Kc, සමතුලිතාවයේ', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2023 AND q.question_number = 30
ON CONFLICT (question_id, option_label) DO NOTHING;
