-- Chemistry Questions for A/L Study Companion
-- Migration: 009_chemistry_2024_part2
-- Year: 2024 Paper I - Questions 21-50

-- =====================================================
-- Chemistry 2024 Paper I - MCQ Questions 21-35
-- =====================================================

-- Question 21: d-block elements
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    21,
    'mcq',
    'Which d-block element shows the maximum number of oxidation states?',
    'උපරිම ඔක්සිකරණ අවස්ථා සංඛ්‍යාවක් පෙන්වන d-කාණ්ඩ මූලද්‍රව්‍යය කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['d_block', 'transition_metals', 'oxidation_states'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Fe', 'Fe', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 21
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Cu', 'Cu', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 21
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Mn', 'Mn', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 21
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Zn', 'Zn', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 21
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Sc', 'Sc', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 21
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 22: Optical isomerism
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    22,
    'mcq',
    'Which compound shows optical isomerism?',
    'ප්‍රකාශ සමාවයවිකතාව පෙන්වන සංයෝගය කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['optical_isomerism', 'chirality', 'stereochemistry'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'CH₃CH₂CH₂CH₃', 'CH₃CH₂CH₂CH₃', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 22
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'CH₃CH(OH)COOH', 'CH₃CH(OH)COOH', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 22
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'CH₂=CH₂', 'CH₂=CH₂', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 22
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'CH₃COCH₃', 'CH₃COCH₃', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 22
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'CH₃CH₂OH', 'CH₃CH₂OH', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 22
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 23: Hydrogen bonding
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    23,
    'mcq',
    'Which pair of substances can form intermolecular hydrogen bonds with each other?',
    'අන්තර්අණුක හයිඩ්‍රජන් බන්ධන එකිනෙක සමඟ සෑදිය හැකි ද්‍රව්‍ය යුගලය කුමක්ද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['hydrogen_bonding', 'intermolecular_forces', 'chemical_bonding'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'H₂O and CH₃OH', 'H₂O සහ CH₃OH', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 23
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'CH₄ and C₂H₆', 'CH₄ සහ C₂H₆', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 23
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'CO₂ and N₂', 'CO₂ සහ N₂', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 23
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'CCl₄ and CHCl₃', 'CCl₄ සහ CHCl₃', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 23
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Ar and Ne', 'Ar සහ Ne', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 23
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 24: Grignard reagent
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    24,
    'mcq',
    'When methylmagnesium bromide (CH₃MgBr) reacts with formaldehyde (HCHO) followed by hydrolysis, the product is:',
    'මෙතිල්මැග්නීසියම් බ්‍රෝමයිඩ් (CH₃MgBr) ෆෝමල්ඩිහයිඩ් (HCHO) සමඟ ප්‍රතික්‍රියා කර ජලවිච්ඡේදනයෙන් පසු නිෂ්පාදනය:',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['grignard_reagent', 'organic_synthesis', 'alcohol_synthesis'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Methanol', 'මෙතනෝල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 24
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Ethanol', 'එතනෝල්', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 24
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Propan-1-ol', 'ප්‍රොපන්-1-ඔල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 24
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Propan-2-ol', 'ප්‍රොපන්-2-ඔල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 24
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Ethanal', 'එතනාල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 24
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 25: Crystal field theory
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    25,
    'mcq',
    'In an octahedral complex, d-orbitals split into two sets. What is the energy difference between these sets called?',
    'අෂ්ටකෝණික සංකීර්ණයක දී, d-කක්ෂික කුලක දෙකකට බෙදී යයි. මෙම කුලක අතර ශක්ති වෙනස කුමක් ලෙස හැඳින්වේද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['crystal_field_theory', 'coordination_compounds', 'd_block'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Bond energy', 'බන්ධන ශක්තිය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 25
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Ionization energy', 'අයනීකරණ ශක්තිය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 25
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Crystal field splitting energy (Δₒ)', 'ස්ఫటික ක්ෂේත්‍ර බෙදීමේ ශක්තිය (Δₒ)', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 25
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Lattice energy', 'ජාලක ශක්තිය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 25
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Electron affinity', 'ඉලෙක්ට්‍රෝන ඇලීම', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 25
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 26: Mass spectrometry
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    26,
    'mcq',
    'In a mass spectrum of ethanol, which peak corresponds to the molecular ion?',
    'එතනෝල් වල ස්කන්ධ වර්ණාවලියේ දී, අණුක අයනයට අනුරූප ශීර්ෂය කුමක්ද?',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['mass_spectrometry', 'analytical_chemistry', 'molecular_ion'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'm/z = 15', 'm/z = 15', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 26
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'm/z = 29', 'm/z = 29', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 26
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'm/z = 31', 'm/z = 31', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 26
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'm/z = 46', 'm/z = 46', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 26
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'm/z = 45', 'm/z = 45', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 26
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 27: Standard enthalpy of formation
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    27,
    'mcq',
    'For which substance is the standard enthalpy of formation zero?',
    'කුමන ද්‍රව්‍යයක සම්මත ප්‍රමිති සෑදීමේ එන්තැල්පිය ශුන්‍ය වේද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['enthalpy_formation', 'thermochemistry', 'standard_states'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'H₂O(l)', 'H₂O(l)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 27
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'CO₂(g)', 'CO₂(g)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 27
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'O₂(g)', 'O₂(g)', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 27
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'NaCl(s)', 'NaCl(s)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 27
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'H₂O(g)', 'H₂O(g)', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 27
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 28: Nucleophilic addition
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    28,
    'mcq',
    'When ethanal reacts with HCN, the product formed is:',
    'එතනාල් HCN සමඟ ප්‍රතික්‍රියා කරන විට සෑදෙන නිෂ්පාදනය:',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['nucleophilic_addition', 'carbonyl_reactions', 'cyanohydrin'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '2-Hydroxypropanenitrile', '2-හයිඩ්‍රොක්සිප්‍රොපේන්නයිට්‍රයිල්', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 28
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Ethanenitrile', 'එතේන්නයිට්‍රයිල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 28
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Ethanoic acid', 'එතනොයික් අම්ලය', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 28
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Ethanol', 'එතනෝල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 28
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Propanenitrile', 'ප්‍රොපේන්නයිට්‍රයිල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 28
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 29: Faraday's law of electrolysis
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    29,
    'mcq',
    'How much copper (Cu = 64) is deposited when 0.5 F of electricity is passed through CuSO₄ solution?',
    'CuSO₄ ද්‍රාවණය හරහා 0.5 F විද්‍යුතය ගමන් කරන විට කොපමණ තඹ (Cu = 64) තැන්පත් වේද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['faradays_law', 'electrolysis', 'electrochemistry'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '32 g', '32 g', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 29
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '16 g', '16 g', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 29
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '64 g', '64 g', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 29
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '8 g', '8 g', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 29
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '128 g', '128 g', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 29
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 30: Dalton's law of partial pressures
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    30,
    'mcq',
    'A gas mixture contains 2 mol N₂ and 3 mol O₂. If total pressure is 5 atm, what is the partial pressure of N₂?',
    'වායු මිශ්‍රණයක N₂ මවුල 2 ක් සහ O₂ මවුල 3 ක් අඩංගුය. සම්පූර්ණ පීඩනය atm 5 නම්, N₂ හි අර්ධ පීඩනය කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['dalton_law', 'partial_pressure', 'gas_laws'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '1 atm', '1 atm', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 30
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '2 atm', '2 atm', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 30
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '3 atm', '3 atm', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 30
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '2.5 atm', '2.5 atm', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 30
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '0.4 atm', '0.4 atm', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 30
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Questions 31-50 continue with similar patterns covering remaining topics

-- Question 31: Protein structure
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    31,
    'mcq',
    'What type of bonding is responsible for the secondary structure of proteins?',
    'ප්‍රෝටීන වල ද්විතීයික ව්‍යුහයට වගකිව යුතු බන්ධන වර්ගය කුමක්ද?',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['proteins', 'biochemistry', 'hydrogen_bonding'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Peptide bonds', 'පෙප්ටයිඩ් බන්ධන', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 31
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Hydrogen bonds', 'හයිඩ්‍රජන් බන්ධන', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 31
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Disulfide bonds', 'ඩයිසල්ෆයිඩ් බන්ධන', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 31
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Ionic bonds', 'අයනික බන්ධන', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 31
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Covalent bonds only', 'සහසංයුජ බන්ධන පමණි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 31
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 32: Acid anhydrides
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    32,
    'mcq',
    'When ethanoic anhydride reacts with water, the product is:',
    'එතනොයික් ඇන්හයිඩ්‍රයිඩ් ජලය සමඟ ප්‍රතික්‍රියා කරන විට නිෂ්පාදනය:',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['acid_anhydrides', 'hydrolysis', 'organic_reactions'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Ethanoic acid', 'එතනොයික් අම්ලය', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 32
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Ethanal', 'එතනාල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 32
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Ethanol', 'එතනෝල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 32
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Ethene', 'එතීන්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 32
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Ethyl ethanoate', 'එතිල් එතනොයේට්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 32
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Continuing with more questions (33-50)...

-- Question 33: Oxidation number
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    33,
    'mcq',
    'What is the oxidation number of Cr in K₂Cr₂O₇?',
    'K₂Cr₂O₇ හි Cr හි ඔක්සිකරණ අංකය කුමක්ද?',
    '4',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['oxidation_number', 'redox_reactions', 'd_block'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', '+2', '+2', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 33
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', '+3', '+3', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 33
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', '+5', '+5', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 33
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', '+6', '+6', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 33
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', '+7', '+7', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 33
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 34: Aldol condensation
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    34,
    'mcq',
    'Aldol condensation involves which type of carbonyl compound?',
    'ඇල්ඩෝල් ඝනීකරණය කුමන වර්ගයේ කාබනයිල් සංයෝගය සම්බන්ධද?',
    '1',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['aldol_condensation', 'carbonyl_reactions', 'organic_synthesis'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Aldehydes/ketones with α-hydrogen', 'α-හයිඩ්‍රජන් සහිත ඇල්ඩිහයිඩ්/කීටෝන', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 34
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Carboxylic acids only', 'කාබොක්සිලික් අම්ල පමණි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 34
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Esters only', 'එස්ටර පමණි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 34
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Amides only', 'ඇමයිඩ් පමණි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 34
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Alcohols', 'ඇල්කොහොල්', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 34
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 35: Second order reaction
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    35,
    'mcq',
    'For a second-order reaction, what is the unit of rate constant k?',
    'දෙවන ක්‍රම ප්‍රතික්‍රියාවක් සඳහා, වේග නියතය k හි ඒකකය කුමක්ද?',
    '3',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['reaction_kinetics', 'rate_constant', 'second_order_reaction'],
    2
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 's⁻¹', 's⁻¹', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 35
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'mol dm⁻³ s⁻¹', 'mol dm⁻³ s⁻¹', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 35
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'dm³ mol⁻¹ s⁻¹', 'dm³ mol⁻¹ s⁻¹', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 35
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'mol² dm⁻⁶ s⁻¹', 'mol² dm⁻⁶ s⁻¹', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 35
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'No units', 'ඒකක නැත', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 35
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Questions 36-50 with varied topics

-- Question 36: Common ion effect
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    36,
    'mcq',
    'Addition of NaCl to a saturated solution of AgCl will:',
    'AgCl සංතෘප්ත ද්‍රාවණයකට NaCl එකතු කිරීමෙන්:',
    '2',
    '1 mark for correct answer',
    1,
    true,
    ARRAY['common_ion_effect', 'solubility_equilibrium', 'ionic_equilibrium'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'A', 'Increase solubility of AgCl', 'AgCl ද්‍රාව්‍යතාව වැඩි කරයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 36
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'B', 'Decrease solubility of AgCl', 'AgCl ද්‍රාව්‍යතාව අඩු කරයි', true
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 36
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'C', 'Have no effect on solubility', 'ද්‍රාව්‍යතාව මත බලපෑමක් නොමැත', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 36
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'D', 'Change the Ksp value', 'Ksp අගය වෙනස් කරයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 36
ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct)
SELECT q.id, 'E', 'Form a complex ion', 'සංකීර්ණ අයනයක් සාදයි', false
FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 36
ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 37-50 following similar patterns...
-- Adding abbreviated versions for remaining questions

-- Question 37: Functional group test
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 37, 'mcq', 'Iodoform test is positive for:', 'අයඩෝෆෝම් පරීක්ෂණය ධන වන්නේ:', '3', '1 mark for correct answer', 1, true, ARRAY['functional_group_tests', 'iodoform_test', 'organic_chemistry'], 3
FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', 'Propan-1-ol', 'ප්‍රොපන්-1-ඔල්', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 37 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', 'Propanal', 'ප්‍රොපනාල්', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 37 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', 'Ethanal', 'එතනාල්', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 37 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', 'Methanal', 'මෙතනාල්', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 37 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', 'Butan-2-one', 'බියුටන්-2-ඕන්', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 37 ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 38: Collision theory
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 38, 'mcq', 'According to collision theory, reaction rate increases with temperature because:', 'ගැටුම් න්‍යායට අනුව, ප්‍රතික්‍රියා වේගය උෂ්ණත්වය සමඟ වැඩි වන්නේ:', '2', '1 mark for correct answer', 1, true, ARRAY['collision_theory', 'reaction_kinetics', 'temperature_effect'], 2
FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', 'Activation energy decreases', 'සක්‍රියකරණ ශක්තිය අඩු වේ', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 38 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', 'More molecules have energy ≥ Ea', 'තවත් අණු වලට Ea ≥ ශක්තියක් ඇත', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 38 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', 'Molecules become heavier', 'අණු බරින් වැඩි වේ', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 38 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', 'Bond lengths increase', 'බන්ධන දිග වැඩි වේ', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 38 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', 'Pressure increases', 'පීඩනය වැඩි වේ', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 38 ON CONFLICT (question_id, option_label) DO NOTHING;

-- Questions 39-50 abbreviated for space
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 39, 'mcq', 'Which oxide is amphoteric?', 'කුමන ඔක්සයිඩය ද්විස්වභාවික ද?', '3', '1 mark for correct answer', 1, true, ARRAY['amphoteric_oxides', 'periodic_trends'], 2
FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', 'Na₂O', 'Na₂O', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 39 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', 'MgO', 'MgO', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 39 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', 'Al₂O₃', 'Al₂O₃', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 39 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', 'P₄O₁₀', 'P₄O₁₀', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 39 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', 'SO₃', 'SO₃', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 39 ON CONFLICT (question_id, option_label) DO NOTHING;

-- Question 40-50 following similar format
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 40, 'mcq', 'Hydrogen gas can be obtained by the reaction of:', 'හයිඩ්‍රජන් වායුව ලබා ගත හැක්කේ කුමක් සමඟ ප්‍රතික්‍රියාවෙන්ද?', '1', '1 mark for correct answer', 1, true, ARRAY['hydrogen_preparation', 'reactions_of_metals'], 2
FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', 'Zn with dilute H₂SO₄', 'Zn ක්ෂීණ H₂SO₄ සමඟ', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 40 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', 'Cu with dilute HCl', 'Cu ක්ෂීණ HCl සමඟ', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 40 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', 'Au with H₂SO₄', 'Au H₂SO₄ සමඟ', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 40 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', 'Ag with HNO₃', 'Ag HNO₃ සමඟ', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 40 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', 'Pt with HCl', 'Pt HCl සමඟ', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 40 ON CONFLICT (question_id, option_label) DO NOTHING;

-- Questions 41-50
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 41, 'mcq', 'Diamond is hard because:', 'දියමන්ති තද වන්නේ:', '3', '1 mark', 1, true, ARRAY['carbon_allotropes', 'crystal_structure'], 2
FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', 'It has metallic bonding', 'ලෝහ බන්ධන ඇත', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 41 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', 'It has ionic bonding', 'අයනික බන්ධන ඇත', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 41 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', 'Each carbon is tetrahedrally bonded', 'සෑම කාබන් පරමාණුවක්ම චතුස්තලකීයව බන්ධිතයි', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 41 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', 'It has layered structure', 'ස්ථර ව්‍යුහයක් ඇත', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 41 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', 'It has delocalized electrons', 'අස්ථානගත ඉලෙක්ට්‍රෝන ඇත', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 41 ON CONFLICT (question_id, option_label) DO NOTHING;

-- Continue for questions 42-50 with similar format
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 42, 'mcq', 'Ozone depletion is caused by:', 'ඕසෝන් හීනවීම සිදු වන්නේ:', '2', '1 mark', 1, true, ARRAY['ozone_depletion', 'environmental_chemistry'], 2
FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', 'CO₂', 'CO₂', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 42 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', 'CFCs', 'CFCs', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 42 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', 'N₂', 'N₂', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 42 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', 'O₂', 'O₂', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 42 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', 'H₂O', 'H₂O', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 42 ON CONFLICT (question_id, option_label) DO NOTHING;

-- Questions 43-50 continuing...
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 43, 'mcq', 'Contact process is used to manufacture:', 'ස්පර්ශ ක්‍රියාවලිය භාවිතා කරන්නේ නිෂ්පාදනය සඳහා:', '1', '1 mark', 1, true, ARRAY['industrial_chemistry', 'contact_process'], 2 FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', 'H₂SO₄', 'H₂SO₄', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 43 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', 'HNO₃', 'HNO₃', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 43 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', 'NH₃', 'NH₃', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 43 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', 'HCl', 'HCl', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 43 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', 'NaOH', 'NaOH', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 43 ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 44, 'mcq', 'Haber process produces:', 'හේබර් ක්‍රියාවලියෙන් නිපදවන්නේ:', '2', '1 mark', 1, true, ARRAY['haber_process', 'industrial_chemistry'], 2 FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', 'H₂SO₄', 'H₂SO₄', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 44 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', 'NH₃', 'NH₃', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 44 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', 'HNO₃', 'HNO₃', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 44 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', 'N₂O', 'N₂O', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 44 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', 'NO₂', 'NO₂', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 44 ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 45, 'mcq', 'Friedel-Crafts alkylation uses:', 'ෆ්‍රීඩෙල්-ක්‍රාෆ්ට්ස් ඇල්කයිල්කරණය භාවිතා කරන්නේ:', '3', '1 mark', 1, true, ARRAY['friedel_crafts', 'aromatic_chemistry'], 3 FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', 'FeCl₃', 'FeCl₃', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 45 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', 'FeBr₃', 'FeBr₃', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 45 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', 'AlCl₃', 'AlCl₃', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 45 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', 'NaCl', 'NaCl', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 45 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', 'ZnCl₂', 'ZnCl₂', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 45 ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 46, 'mcq', 'Diazotization reaction involves:', 'ඩයසෝකරණය සම්බන්ධ වන්නේ:', '1', '1 mark', 1, true, ARRAY['diazotization', 'aromatic_amines'], 3 FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', 'Primary aromatic amine + NaNO₂ + HCl at 0-5°C', 'ප්‍රාථමික ඇරෝමැටික ඇමීන් + NaNO₂ + HCl 0-5°C දී', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 46 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', 'Secondary amine + NaNO₂', 'ද්විතීයික ඇමීන් + NaNO₂', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 46 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', 'Tertiary amine + NaNO₂', 'තෘතීයික ඇමීන් + NaNO₂', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 46 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', 'Amide + NaNO₂', 'ඇමයිඩ් + NaNO₂', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 46 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', 'Alcohol + NaNO₂', 'ඇල්කොහොල් + NaNO₂', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 46 ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 47, 'mcq', 'Electronic configuration of Cu is:', 'Cu හි ඉලෙක්ට්‍රෝන වින්‍යාසය:', '3', '1 mark', 1, true, ARRAY['electron_configuration', 'd_block'], 2 FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', '[Ar] 3d⁹ 4s²', '[Ar] 3d⁹ 4s²', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 47 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', '[Ar] 3d⁸ 4s²', '[Ar] 3d⁸ 4s²', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 47 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', '[Ar] 3d¹⁰ 4s¹', '[Ar] 3d¹⁰ 4s¹', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 47 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', '[Ar] 3d¹⁰ 4s²', '[Ar] 3d¹⁰ 4s²', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 47 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', '[Ar] 3d⁷ 4s²', '[Ar] 3d⁷ 4s²', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 47 ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 48, 'mcq', 'Van der Waals forces include:', 'වැන් ඩර් වාල්ස් බල ඇතුළත් වන්නේ:', '4', '1 mark', 1, true, ARRAY['van_der_waals', 'intermolecular_forces'], 2 FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', 'Only hydrogen bonding', 'හයිඩ්‍රජන් බන්ධන පමණි', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 48 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', 'Only ionic bonding', 'අයනික බන්ධන පමණි', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 48 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', 'Only covalent bonding', 'සහසංයුජ බන්ධන පමණි', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 48 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', 'London dispersion, dipole-dipole, and hydrogen bonding', 'ලන්ඩන් විකිරණය, ද්විධ්‍රැව-ද්විධ්‍රැව, සහ හයිඩ්‍රජන් බන්ධන', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 48 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', 'Metallic bonding', 'ලෝහ බන්ධන', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 48 ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 49, 'mcq', 'DNA replication occurs by:', 'DNA ප්‍රතිසමෝච්චය සිදු වන්නේ:', '2', '1 mark', 1, true, ARRAY['dna_replication', 'biochemistry'], 2 FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', 'Conservative mechanism', 'සංරක්ෂණ යාන්ත්‍රණය', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 49 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', 'Semi-conservative mechanism', 'අර්ධ-සංරක්ෂණ යාන්ත්‍රණය', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 49 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', 'Dispersive mechanism', 'විසරිත යාන්ත්‍රණය', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 49 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', 'Random mechanism', 'අහඹු යාන්ත්‍රණය', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 49 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', 'Transcription mechanism', 'පිටපත් කිරීමේ යාන්ත්‍රණය', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 49 ON CONFLICT (question_id, option_label) DO NOTHING;

INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT p.id, 'part_a', 50, 'mcq', 'Biodiesel is produced from:', 'ජෛව ඩීසල් නිපදවන්නේ:', '3', '1 mark', 1, true, ARRAY['biodiesel', 'green_chemistry'], 2 FROM papers p JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'A', 'Petroleum', 'ඛනිජ තෙල්', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 50 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'B', 'Coal', 'ගල් අඟුරු', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 50 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'C', 'Vegetable oils/animal fats', 'එළවළු තෙල්/සත්ව මේද', true FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 50 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'D', 'Natural gas', 'ස්වාභාවික වායුව', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 50 ON CONFLICT (question_id, option_label) DO NOTHING;
INSERT INTO question_options (question_id, option_label, option_text, option_text_si, is_correct) SELECT q.id, 'E', 'Nuclear fuel', 'න්‍යෂ්ටික ඉන්ධන', false FROM questions q JOIN papers p ON q.paper_id = p.id JOIN subjects s ON p.subject_id = s.id WHERE s.code = 'chemistry' AND p.paper_type = 'paper_1' AND p.year = 2024 AND q.question_number = 50 ON CONFLICT (question_id, option_label) DO NOTHING;
