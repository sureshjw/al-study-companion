-- Chemistry Paper II Structured Questions for A/L Study Companion
-- Migration: 010_chemistry_paper2_structured
-- Years: 2023, 2024 Paper II - Structured Questions

-- =====================================================
-- Chemistry 2023 Paper II - Part A (Short Answer) Questions 1-4
-- =====================================================

-- Part A Question 1: Atomic structure and electronic configuration
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    1,
    'short_structured',
    '(a) Write the electronic configuration of Fe²⁺ ion.
(b) Explain why Fe²⁺ is paramagnetic.
(c) Calculate the number of unpaired electrons in Fe²⁺.
(d) State the magnetic moment formula and calculate the spin-only magnetic moment.',
    '(අ) Fe²⁺ අයනයේ ඉලෙක්ට්‍රෝන වින්‍යාසය ලියන්න.
(ආ) Fe²⁺ පරාමැග්නටික් වන්නේ ඇයි දැයි පැහැදිලි කරන්න.
(ඇ) Fe²⁺ හි යුගල නොකළ ඉලෙක්ට්‍රෝන ගණන ගණනය කරන්න.
(ඈ) චුම්භක ඝූර්ණ සූත්‍රය ප්‍රකාශ කර ස්පින්-පමණක් චුම්භක ඝූර්ණය ගණනය කරන්න.',
    'See marking scheme',
    '(a) [Ar] 3d⁶ - 1 mark
(b) Has unpaired electrons - 1 mark
(c) 4 unpaired electrons - 1 mark
(d) μ = √n(n+2) BM = √4(4+2) = √24 = 4.90 BM - 2 marks',
    5,
    true,
    ARRAY['electron_configuration', 'd_block', 'magnetic_properties'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- Part A Question 2: Chemical equilibrium
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    2,
    'short_structured',
    'For the equilibrium: N₂O₄(g) ⇌ 2NO₂(g), Kp = 0.17 atm at 25°C.
(a) Calculate Kc at 25°C. (R = 0.0821 L atm mol⁻¹ K⁻¹)
(b) If total pressure is 1 atm, calculate the partial pressure of NO₂.
(c) Calculate the degree of dissociation (α).
(d) Predict the effect of increasing pressure on equilibrium position.',
    'N₂O₄(g) ⇌ 2NO₂(g) සමතුලිතාවය සඳහා, 25°C දී Kp = 0.17 atm.
(අ) 25°C දී Kc ගණනය කරන්න.
(ආ) සම්පූර්ණ පීඩනය 1 atm නම්, NO₂ හි අර්ධ පීඩනය ගණනය කරන්න.
(ඇ) විඝටන මාත්‍රාව (α) ගණනය කරන්න.
(ඈ) පීඩනය වැඩි කිරීමේ බලපෑම සමතුලිත ස්ථානය මත අනාවැකි කියන්න.',
    'See marking scheme',
    '(a) Kc = Kp/(RT)^Δn = 0.17/(0.0821 × 298) = 6.95 × 10⁻³ mol dm⁻³ - 2 marks
(b) Using Kp and total pressure calculation - 1 mark
(c) α calculation from Kp expression - 1 mark
(d) Equilibrium shifts left (toward N₂O₄) - 1 mark',
    5,
    true,
    ARRAY['chemical_equilibrium', 'kp_kc_relationship', 'le_chatelier'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- Part A Question 3: Organic chemistry - Reactions
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    3,
    'short_structured',
    'A compound A (C₄H₈O) does not react with Fehling solution but gives a positive 2,4-DNP test. A on reduction with NaBH₄ gives B. B reacts with HBr to give C.
(a) Identify compounds A, B, and C.
(b) Write the reaction of A with NaBH₄.
(c) Name the mechanism of the reaction B → C.
(d) Explain why A does not reduce Fehling solution.',
    'A සංයෝගය (C₄H₈O) ෆේලිං ද්‍රාවණය සමඟ ප්‍රතික්‍රියා නොකරන නමුත් ධන 2,4-DNP පරීක්ෂණයක් ලබා දෙයි. A, NaBH₄ සමඟ අවකරණයෙන් B ලබා දෙයි. B, HBr සමඟ ප්‍රතික්‍රියා කර C ලබා දෙයි.
(අ) A, B, සහ C සංයෝග හඳුනා ගන්න.
(ආ) A හි NaBH₄ සමඟ ප්‍රතික්‍රියාව ලියන්න.
(ඇ) B → C ප්‍රතික්‍රියාවේ යාන්ත්‍රණය නම් කරන්න.
(ඈ) A ෆේලිං ද්‍රාවණය අවකරණය නොකරන්නේ ඇයි දැයි පැහැදිලි කරන්න.',
    'See marking scheme',
    '(a) A = Butanone/Butan-2-one, B = Butan-2-ol, C = 2-Bromobutane - 2 marks
(b) CH₃COCH₂CH₃ + NaBH₄ → CH₃CH(OH)CH₂CH₃ - 1 mark
(c) SN1 or SN2 mechanism - 1 mark
(d) Ketones cannot be oxidized under mild conditions - 1 mark',
    5,
    true,
    ARRAY['carbonyl_compounds', 'reduction', 'organic_reactions'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- Part A Question 4: Electrochemistry
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    4,
    'short_structured',
    'A galvanic cell is constructed using Zn and Cu electrodes.
Given: E°(Zn²⁺/Zn) = -0.76 V, E°(Cu²⁺/Cu) = +0.34 V
(a) Write the cell notation.
(b) Calculate the standard cell potential (E°cell).
(c) Write the overall cell reaction.
(d) Calculate ΔG° for the cell reaction. (F = 96500 C mol⁻¹)
(e) Identify the anode and cathode.',
    'Zn සහ Cu ඉලෙක්ට්‍රෝඩ භාවිතා කරමින් ගැල්වනික කෝෂයක් සාදා ඇත.
ලබා දී ඇත: E°(Zn²⁺/Zn) = -0.76 V, E°(Cu²⁺/Cu) = +0.34 V
(අ) කෝෂ අංකනය ලියන්න.
(ආ) සම්මත කෝෂ විභවය (E°cell) ගණනය කරන්න.
(ඇ) සමස්ත කෝෂ ප්‍රතික්‍රියාව ලියන්න.
(ඈ) කෝෂ ප්‍රතික්‍රියාව සඳහා ΔG° ගණනය කරන්න.
(ඉ) ඇනෝඩය සහ කැතෝඩය හඳුනා ගන්න.',
    'See marking scheme',
    '(a) Zn(s)|Zn²⁺(aq)||Cu²⁺(aq)|Cu(s) - 1 mark
(b) E°cell = 0.34 - (-0.76) = 1.10 V - 1 mark
(c) Zn(s) + Cu²⁺(aq) → Zn²⁺(aq) + Cu(s) - 1 mark
(d) ΔG° = -nFE° = -2 × 96500 × 1.10 = -212.3 kJ mol⁻¹ - 1 mark
(e) Anode: Zn, Cathode: Cu - 1 mark',
    5,
    true,
    ARRAY['electrochemistry', 'galvanic_cell', 'cell_potential'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- =====================================================
-- Chemistry 2023 Paper II - Part B (Extended Questions) Questions 5-7
-- =====================================================

-- Part B Question 5: Thermodynamics
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_b',
    5,
    'long_structured',
    '(a) Define standard enthalpy of formation with an example. (2 marks)
(b) Using the Born-Haber cycle, calculate the lattice energy of NaCl given:
    ΔHf°(NaCl) = -411 kJ mol⁻¹
    ΔHsub(Na) = +108 kJ mol⁻¹
    IE₁(Na) = +496 kJ mol⁻¹
    ½D(Cl-Cl) = +121 kJ mol⁻¹
    EA(Cl) = -349 kJ mol⁻¹ (5 marks)
(c) Explain why the lattice energy of MgO is greater than that of NaCl. (3 marks)',
    '(අ) සම්මත ප්‍රමිති සෑදීමේ එන්තැල්පිය උදාහරණයක් සමඟ අර්ථ දක්වන්න.
(ආ) බොන්-හේබර් චක්‍රය භාවිතා කරමින්, NaCl හි ජාලක ශක්තිය ගණනය කරන්න.
(ඇ) NaCl ට වඩා MgO හි ජාලක ශක්තිය වැඩි වන්නේ ඇයි දැයි පැහැදිලි කරන්න.',
    'See marking scheme',
    '(a) Definition + example - 2 marks
(b) Born-Haber cycle: LE = -411 - 108 - 496 - 121 + 349 = -787 kJ mol⁻¹ - 5 marks
(c) Higher charges (Mg²⁺, O²⁻) and smaller ionic radii - 3 marks',
    10,
    false,
    ARRAY['born_haber_cycle', 'lattice_energy', 'thermodynamics'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- Part B Question 6: Acid-base equilibrium
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_b',
    6,
    'long_structured',
    '(a) Define pH and pKa. (2 marks)
(b) Calculate the pH of 0.1 mol dm⁻³ CH₃COOH solution. (Ka = 1.8 × 10⁻⁵) (3 marks)
(c) A buffer solution is prepared by mixing equal volumes of 0.2 mol dm⁻³ CH₃COOH and 0.2 mol dm⁻³ CH₃COONa.
    (i) Calculate the pH of the buffer. (2 marks)
    (ii) Calculate the pH when 0.01 mol of HCl is added to 1 dm³ of this buffer. (3 marks)',
    '(අ) pH සහ pKa අර්ථ දක්වන්න.
(ආ) 0.1 mol dm⁻³ CH₃COOH ද්‍රාවණයේ pH ගණනය කරන්න.
(ඇ) 0.2 mol dm⁻³ CH₃COOH සහ 0.2 mol dm⁻³ CH₃COONa සමාන පරිමා මිශ්‍ර කිරීමෙන් ගේන්දර ද්‍රාවණයක් සකසා ඇත.
    (i) ගේන්දරයේ pH ගණනය කරන්න.
    (ii) මෙම ගේන්දරය dm³ 1 කට HCl මවුල 0.01 ක් එකතු කළ විට pH ගණනය කරන්න.',
    'See marking scheme',
    '(a) pH = -log[H⁺], pKa = -logKa - 2 marks
(b) pH = ½(pKa - log c) = ½(4.74 - (-1)) = 2.87 - 3 marks
(c)(i) pH = pKa + log([salt]/[acid]) = 4.74 - 2 marks
(c)(ii) New pH calculation with HCl - 3 marks',
    10,
    false,
    ARRAY['buffer_solutions', 'ph_calculations', 'acid_base_equilibrium'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- Part B Question 7: Organic synthesis
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_b',
    7,
    'long_structured',
    'Starting from benzene and using any other reagents:
(a) Describe the synthesis of nitrobenzene. Write the mechanism. (4 marks)
(b) Convert nitrobenzene to phenol via aniline and diazonium salt. (4 marks)
(c) How would you convert phenol to 2,4,6-tribromophenol? (2 marks)',
    'බෙන්සීන් සිට ආරම්භ කරමින් වෙනත් ඕනෑම ප්‍රතිකාරක භාවිතා කරමින්:
(අ) නයිට්‍රොබෙන්සීන් සංස්ලේෂණය විස්තර කරන්න. යාන්ත්‍රණය ලියන්න.
(ආ) නයිට්‍රොබෙන්සීන් ඇනිලීන් සහ ඩයසෝනියම් ලවණය හරහා ෆීනෝල් බවට පරිවර්තනය කරන්න.
(ඇ) ෆීනෝල් 2,4,6-ට්‍රයිබ්‍රෝමොෆීනෝල් බවට පරිවර්තනය කරන්නේ කෙසේද?',
    'See marking scheme',
    '(a) Nitration mechanism with HNO₃/H₂SO₄ - 4 marks
(b) Reduction to aniline → diazotization → hydrolysis to phenol - 4 marks
(c) Phenol + 3Br₂ → 2,4,6-tribromophenol - 2 marks',
    10,
    false,
    ARRAY['aromatic_chemistry', 'organic_synthesis', 'electrophilic_substitution'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- =====================================================
-- Chemistry 2024 Paper II - Part A Questions 1-4
-- =====================================================

-- 2024 Part A Question 1: Periodic table and properties
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    1,
    'short_structured',
    'Consider elements Na, Mg, Al, Si, P in Period 3.
(a) Arrange in order of increasing first ionization energy. Explain. (2 marks)
(b) Why does Al have lower first ionization energy than Mg? (1 mark)
(c) Write the formula and predict the nature (acidic/basic/amphoteric) of the oxide of Al. (1 mark)
(d) Describe the reaction of Al₂O₃ with dilute HCl and dilute NaOH. (1 mark)',
    'Na, Mg, Al, Si, P යන 3 වන ආවර්තයේ මූලද්‍රව්‍ය සලකන්න.
(අ) වැඩිවන පළමු අයනීකරණ ශක්තිය අනුපිළිවෙලට සකසන්න. පැහැදිලි කරන්න.
(ආ) Mg ට වඩා Al හි පළමු අයනීකරණ ශක්තිය අඩු වන්නේ ඇයි?
(ඇ) Al හි ඔක්සයිඩයේ සූත්‍රය ලියා එහි ස්වභාවය (අම්ල/භෂ්ම/ද්විස්වභාවික) අනාවැකි කියන්න.
(ඈ) Al₂O₃ හි ක්ෂීණ HCl සහ ක්ෂීණ NaOH සමඟ ප්‍රතික්‍රියාව විස්තර කරන්න.',
    'See marking scheme',
    '(a) Na < Al < Mg < Si < P with explanation - 2 marks
(b) 3p electron more easily removed than 3s - 1 mark
(c) Al₂O₃, amphoteric - 1 mark
(d) Equations with HCl and NaOH - 1 mark',
    5,
    true,
    ARRAY['periodic_trends', 'ionization_energy', 'amphoteric_oxides'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- 2024 Part A Question 2: Reaction kinetics
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    2,
    'short_structured',
    'For the reaction 2A + B → Products, the following data was obtained:
Experiment 1: [A]=0.1M, [B]=0.1M, Rate=2×10⁻³ mol dm⁻³ s⁻¹
Experiment 2: [A]=0.2M, [B]=0.1M, Rate=8×10⁻³ mol dm⁻³ s⁻¹
Experiment 3: [A]=0.1M, [B]=0.2M, Rate=2×10⁻³ mol dm⁻³ s⁻¹
(a) Determine the order with respect to A and B. (2 marks)
(b) Write the rate law. (1 mark)
(c) Calculate the rate constant k with units. (1 mark)
(d) What is the overall order of the reaction? (1 mark)',
    '2A + B → නිෂ්පාදන ප්‍රතික්‍රියාව සඳහා, පහත දත්ත ලබා ගන්නා ලදී:
අත්හදා බැලීම 1: [A]=0.1M, [B]=0.1M, වේගය=2×10⁻³ mol dm⁻³ s⁻¹
අත්හදා බැලීම 2: [A]=0.2M, [B]=0.1M, වේගය=8×10⁻³ mol dm⁻³ s⁻¹
අත්හදා බැලීම 3: [A]=0.1M, [B]=0.2M, වේගය=2×10⁻³ mol dm⁻³ s⁻¹
(අ) A සහ B සම්බන්ධයෙන් ක්‍රමය තීරණය කරන්න.
(ආ) වේග නියමය ලියන්න.
(ඇ) ඒකක සහිතව k වේග නියතය ගණනය කරන්න.
(ඈ) ප්‍රතික්‍රියාවේ සමස්ත ක්‍රමය කුමක්ද?',
    'See marking scheme',
    '(a) Order w.r.t A = 2, Order w.r.t B = 0 - 2 marks
(b) Rate = k[A]² - 1 mark
(c) k = 0.2 dm³ mol⁻¹ s⁻¹ - 1 mark
(d) Overall order = 2 - 1 mark',
    5,
    true,
    ARRAY['reaction_kinetics', 'rate_law', 'order_of_reaction'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- 2024 Part A Question 3: Organic functional groups
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    3,
    'short_structured',
    'Compound X (C₃H₆O₂) gives the following tests:
- Positive test with sodium bicarbonate (effervescence)
- Does not react with Tollens reagent
- Forms an ester with ethanol
(a) Identify compound X. (1 mark)
(b) Write the structure of X. (1 mark)
(c) Write the equation for the reaction of X with NaHCO₃. (1 mark)
(d) Name and write the structure of the ester formed with ethanol. (2 marks)',
    'X සංයෝගය (C₃H₆O₂) පහත පරීක්ෂණ ලබා දෙයි:
- සෝඩියම් බයිකාබනේට් සමඟ ධන පරීක්ෂණය (බුබුලු)
- ටොලන්ස් ප්‍රතිකාරකය සමඟ ප්‍රතික්‍රියා නොකරයි
- එතනෝල් සමඟ එස්ටරයක් සාදයි
(අ) X සංයෝගය හඳුනා ගන්න.
(ආ) X හි ව්‍යුහය ලියන්න.
(ඇ) X හි NaHCO₃ සමඟ ප්‍රතික්‍රියාවේ සමීකරණය ලියන්න.
(ඈ) එතනෝල් සමඟ සෑදෙන එස්ටරය නම් කර ව්‍යුහය ලියන්න.',
    'See marking scheme',
    '(a) Propanoic acid - 1 mark
(b) CH₃CH₂COOH structure - 1 mark
(c) CH₃CH₂COOH + NaHCO₃ → CH₃CH₂COONa + H₂O + CO₂ - 1 mark
(d) Ethyl propanoate, CH₃CH₂COOC₂H₅ - 2 marks',
    5,
    true,
    ARRAY['carboxylic_acids', 'functional_group_tests', 'esters'],
    3
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- 2024 Part A Question 4: Ionic equilibrium
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_a',
    4,
    'short_structured',
    'The solubility product of PbI₂ at 25°C is 7.1 × 10⁻⁹ mol³ dm⁻⁹.
(a) Write the expression for Ksp of PbI₂. (1 mark)
(b) Calculate the molar solubility of PbI₂ in water. (2 marks)
(c) Calculate the molar solubility of PbI₂ in 0.1 mol dm⁻³ KI solution. (2 marks)',
    '25°C දී PbI₂ හි ද්‍රාව්‍යතා ගුණිතය 7.1 × 10⁻⁹ mol³ dm⁻⁹ වේ.
(අ) PbI₂ හි Ksp සඳහා ප්‍රකාශනය ලියන්න.
(ආ) ජලයේ PbI₂ හි මවුලර් ද්‍රාව්‍යතාව ගණනය කරන්න.
(ඇ) 0.1 mol dm⁻³ KI ද්‍රාවණයේ PbI₂ හි මවුලර් ද්‍රාව්‍යතාව ගණනය කරන්න.',
    'See marking scheme',
    '(a) Ksp = [Pb²⁺][I⁻]² - 1 mark
(b) s = ∛(Ksp/4) = 1.21 × 10⁻³ mol dm⁻³ - 2 marks
(c) s = Ksp/[I⁻]² = 7.1 × 10⁻⁷ mol dm⁻³ (common ion effect) - 2 marks',
    5,
    true,
    ARRAY['solubility_product', 'ksp_calculations', 'common_ion_effect'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- =====================================================
-- Chemistry 2024 Paper II - Part B Extended Questions 5-7
-- =====================================================

-- 2024 Part B Question 5: Transition metals
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_b',
    5,
    'long_structured',
    '(a) Define a transition element. Why is Zn not considered a typical transition element? (2 marks)
(b) Explain why transition metal compounds are often colored, with reference to crystal field theory. (3 marks)
(c) [Fe(H₂O)₆]³⁺ is pale violet while [Fe(CN)₆]³⁻ is yellow.
    (i) Explain this difference in color using crystal field theory. (3 marks)
    (ii) Which complex is high spin and which is low spin? Explain. (2 marks)',
    '(අ) සංක්‍රාන්ති මූලද්‍රව්‍යයක් අර්ථ දක්වන්න. Zn සාමාන්‍ය සංක්‍රාන්ති මූලද්‍රව්‍යයක් ලෙස නොසැලකෙන්නේ ඇයි?
(ආ) ස්ఫටික ක්ෂේත්‍ර න්‍යාය සඳහන් කරමින් සංක්‍රාන්ති ලෝහ සංයෝග බොහෝ විට වර්ණවත් වන්නේ ඇයි දැයි පැහැදිලි කරන්න.
(ඇ) [Fe(H₂O)₆]³⁺ සුදුමැලි දම් පැහැති අතර [Fe(CN)₆]³⁻ කහ පැහැතිය.
    (i) ස්ఫටික ක්ෂේත්‍ර න්‍යාය භාවිතයෙන් මෙම වර්ණ වෙනස පැහැදිලි කරන්න.
    (ii) කුමන සංකීර්ණය ඉහළ ස්පින් සහ කුමක් අඩු ස්පින්ද? පැහැදිලි කරන්න.',
    'See marking scheme',
    '(a) Definition + Zn has d¹⁰ configuration - 2 marks
(b) d-d transitions absorb visible light - 3 marks
(c)(i) Different Δₒ values due to different ligands - 3 marks
(c)(ii) High spin: [Fe(H₂O)₆]³⁺, Low spin: [Fe(CN)₆]³⁻ - 2 marks',
    10,
    false,
    ARRAY['transition_metals', 'crystal_field_theory', 'coordination_compounds'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- 2024 Part B Question 6: Thermodynamics
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_b',
    6,
    'long_structured',
    '(a) State the second law of thermodynamics. (1 mark)
(b) Define entropy and explain what determines whether a process is spontaneous. (2 marks)
(c) For the reaction: N₂(g) + 3H₂(g) → 2NH₃(g)
    ΔH° = -92 kJ mol⁻¹, ΔS° = -199 J K⁻¹ mol⁻¹
    (i) Calculate ΔG° at 298 K. (2 marks)
    (ii) Calculate the temperature at which the reaction becomes non-spontaneous. (2 marks)
    (iii) Explain why the Haber process operates at high temperature despite the reaction being exothermic. (3 marks)',
    '(අ) තාපගතිවේදයේ දෙවන නියමය ප්‍රකාශ කරන්න.
(ආ) එන්ට්‍රොපිය අර්ථ දක්වා ක්‍රියාවලියක් ස්වයංසිද්ධ වන්නේ කුමකින් තීරණය වේද යන්න පැහැදිලි කරන්න.
(ඇ) N₂(g) + 3H₂(g) → 2NH₃(g) ප්‍රතික්‍රියාව සඳහා
    ΔH° = -92 kJ mol⁻¹, ΔS° = -199 J K⁻¹ mol⁻¹
    (i) 298 K දී ΔG° ගණනය කරන්න.
    (ii) ප්‍රතික්‍රියාව ස්වයංසිද්ධ නොවන උෂ්ණත්වය ගණනය කරන්න.
    (iii) ප්‍රතික්‍රියාව එක්සොතර්මික් වුවද හේබර් ක්‍රියාවලිය ඉහළ උෂ්ණත්වයේ ක්‍රියාත්මක වන්නේ ඇයි දැයි පැහැදිලි කරන්න.',
    'See marking scheme',
    '(a) Second law statement - 1 mark
(b) Entropy definition, ΔG = ΔH - TΔS determines spontaneity - 2 marks
(c)(i) ΔG° = -92 - 298(-0.199) = -32.7 kJ mol⁻¹ - 2 marks
(c)(ii) T = ΔH/ΔS = 462 K - 2 marks
(c)(iii) Rate of reaction consideration - 3 marks',
    10,
    false,
    ARRAY['thermodynamics', 'gibbs_free_energy', 'entropy'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- 2024 Part B Question 7: Organic chemistry synthesis
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_b',
    7,
    'long_structured',
    '(a) Starting from ethanol, describe the synthesis of:
    (i) Ethyl ethanoate (2 marks)
    (ii) Ethanenitrile (3 marks)
(b) A compound P (C₄H₈O) shows IR absorption at 1715 cm⁻¹ and gives positive iodoform test.
    (i) Identify compound P. (1 mark)
    (ii) Write the mechanism of the iodoform reaction for P. (4 marks)',
    '(අ) එතනෝල් සිට ආරම්භ කරමින්, පහත සඳහන් දෑ සංස්ලේෂණය විස්තර කරන්න:
    (i) එතිල් එතනොයේට්
    (ii) එතේන්නයිට්‍රයිල්
(ආ) P සංයෝගය (C₄H₈O) 1715 cm⁻¹ IR අවශෝෂණය පෙන්වන අතර ධන අයඩෝෆෝම් පරීක්ෂණයක් ලබා දෙයි.
    (i) P සංයෝගය හඳුනා ගන්න.
    (ii) P සඳහා අයඩෝෆෝම් ප්‍රතික්‍රියාවේ යාන්ත්‍රණය ලියන්න.',
    'See marking scheme',
    '(a)(i) Ethanol → oxidation → ethanoic acid → esterification - 2 marks
(a)(ii) Ethanol → ethyl bromide → nitrile - 3 marks
(b)(i) Butan-2-one - 1 mark
(b)(ii) Iodoform mechanism with I₂/NaOH - 4 marks',
    10,
    false,
    ARRAY['organic_synthesis', 'iodoform_test', 'reaction_mechanisms'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- =====================================================
-- Chemistry Paper II - Part C Essay Questions (2023 & 2024)
-- =====================================================

-- 2023 Part C Question 8
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_c',
    8,
    'essay',
    'Discuss the chemistry of halogens with reference to:
(a) Electronic configuration and oxidation states
(b) Reactions with hydrogen
(c) Reactions with alkalis (cold and hot dilute NaOH)
(d) Displacement reactions in aqueous solution
(e) Uses of halogens and their compounds',
    'හේලජන වල රසායනය පහත සඳහන් සඳහා සාකච්ඡා කරන්න:
(අ) ඉලෙක්ට්‍රෝන වින්‍යාසය සහ ඔක්සිකරණ අවස්ථා
(ආ) හයිඩ්‍රජන් සමඟ ප්‍රතික්‍රියා
(ඇ) ක්ෂාර සමඟ ප්‍රතික්‍රියා (සීතල සහ උණුසුම් ක්ෂීණ NaOH)
(ඈ) ජලීය ද්‍රාවණයේ විස්ථාපන ප්‍රතික්‍රියා
(ඉ) හේලජන සහ ඒවායේ සංයෝගවල භාවිත',
    'See marking scheme',
    'Each section carries appropriate marks for complete discussion',
    15,
    false,
    ARRAY['halogens', 'p_block', 'redox_reactions'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2023
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;

-- 2024 Part C Question 8
INSERT INTO questions (paper_id, part_type, question_number, question_type, question_text, question_text_si, correct_answer, marking_scheme, marks, is_compulsory, topic_tags, difficulty_level)
SELECT 
    p.id,
    'part_c',
    8,
    'essay',
    'Discuss the preparation, properties, and reactions of alcohols with reference to:
(a) Classification of alcohols (primary, secondary, tertiary)
(b) Industrial preparation of ethanol
(c) Chemical properties: oxidation, dehydration, esterification
(d) Distinction between primary, secondary, and tertiary alcohols
(e) Important uses of alcohols',
    'ඇල්කොහොල් සකස් කිරීම, ගුණාංග සහ ප්‍රතික්‍රියා පහත සඳහන් සඳහා සාකච්ඡා කරන්න:
(අ) ඇල්කොහොල් වර්ගීකරණය (ප්‍රාථමික, ද්විතීයික, තෘතීයික)
(ආ) එතනෝල් කාර්මික සකස් කිරීම
(ඇ) රසායනික ගුණාංග: ඔක්සිකරණය, විජලනය, එස්ටර්කරණය
(ඈ) ප්‍රාථමික, ද්විතීයික සහ තෘතීයික ඇල්කොහොල් අතර වෙනස හඳුනා ගැනීම
(ඉ) ඇල්කොහොල් වල වැදගත් භාවිත',
    'See marking scheme',
    'Each section carries appropriate marks for complete discussion',
    15,
    false,
    ARRAY['alcohols', 'organic_chemistry', 'functional_groups'],
    4
FROM papers p
JOIN subjects s ON p.subject_id = s.id
WHERE s.code = 'chemistry' AND p.paper_type = 'paper_2' AND p.year = 2024
ON CONFLICT (paper_id, part_type, question_number) DO NOTHING;
