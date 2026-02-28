-- Seed data for A/L Study Companion
-- Migration: 002_seed_data

-- Insert subjects
INSERT INTO subjects (code, name_en, name_si, color, icon) VALUES
('combined_maths', 'Combined Mathematics', 'සංයුක්ත ගණිතය', '#3B82F6', '∫'),
('physics', 'Physics', 'භෞතික විද්‍යාව', '#22C55E', '⚛'),
('chemistry', 'Chemistry', 'රසායන විද්‍යාව', '#F97316', '🧪');

-- Insert topics for Combined Mathematics
INSERT INTO topics (subject_id, name_en, name_si, syllabus_reference) VALUES
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'Mathematical Induction', 'ගණිතමය ආගමනය', 'CM-1.1'),
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'Complex Numbers', 'සංකීර්ණ සංඛ්‍යා', 'CM-1.2'),
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'Polynomial Equations', 'බහුපද සමීකරණ', 'CM-1.3'),
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'Trigonometry', 'ත්‍රිකෝණමිතිය', 'CM-2.1'),
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'Limits and Continuity', 'සීමා සහ අඛණ්ඩතාව', 'CM-3.1'),
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'Differentiation', 'අවකලනය', 'CM-3.2'),
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'Integration', 'සමාකලනය', 'CM-3.3'),
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'Vectors', 'දෛශික', 'CM-4.1'),
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'Matrices', 'න්‍යාස', 'CM-4.2'),
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'Coordinate Geometry', 'ඛණ්ඩාංක ජ්‍යාමිතිය', 'CM-5.1'),
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'Conic Sections', 'කේතුකක කඩ', 'CM-5.2'),
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'Mechanics', 'යාන්ත්‍ර විද්‍යාව', 'CM-6.1'),
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'Statistics', 'සංඛ්‍යාන', 'CM-7.1');

-- Insert topics for Physics
INSERT INTO topics (subject_id, name_en, name_si, syllabus_reference) VALUES
((SELECT id FROM subjects WHERE code = 'physics'), 'Mechanics', 'යාන්ත්‍ර විද්‍යාව', 'PHY-1.1'),
((SELECT id FROM subjects WHERE code = 'physics'), 'Kinematics', 'චලන විද්‍යාව', 'PHY-1.2'),
((SELECT id FROM subjects WHERE code = 'physics'), 'Dynamics', 'ගතිකය', 'PHY-1.3'),
((SELECT id FROM subjects WHERE code = 'physics'), 'Work and Energy', 'කාර්යය සහ ශක්තිය', 'PHY-2.1'),
((SELECT id FROM subjects WHERE code = 'physics'), 'Oscillations', 'දෝලන', 'PHY-3.1'),
((SELECT id FROM subjects WHERE code = 'physics'), 'Waves', 'තරංග', 'PHY-3.2'),
((SELECT id FROM subjects WHERE code = 'physics'), 'Optics', 'ප්‍රකාශ විද්‍යාව', 'PHY-4.1'),
((SELECT id FROM subjects WHERE code = 'physics'), 'Thermodynamics', 'තාප ගතිකය', 'PHY-5.1'),
((SELECT id FROM subjects WHERE code = 'physics'), 'Electrostatics', 'විද්‍යුත් ස්ථිතිකය', 'PHY-6.1'),
((SELECT id FROM subjects WHERE code = 'physics'), 'Current Electricity', 'ධාරා විද්‍යුතය', 'PHY-6.2'),
((SELECT id FROM subjects WHERE code = 'physics'), 'Magnetism', 'චුම්බකත්වය', 'PHY-7.1'),
((SELECT id FROM subjects WHERE code = 'physics'), 'Electromagnetic Induction', 'විද්‍යුත් චුම්බක ආගමනය', 'PHY-7.2'),
((SELECT id FROM subjects WHERE code = 'physics'), 'Modern Physics', 'නූතන භෞතික විද්‍යාව', 'PHY-8.1'),
((SELECT id FROM subjects WHERE code = 'physics'), 'Dimensional Analysis', 'මාන විශ්ලේෂණය', 'PHY-1.0');

-- Insert topics for Chemistry
INSERT INTO topics (subject_id, name_en, name_si, syllabus_reference) VALUES
((SELECT id FROM subjects WHERE code = 'chemistry'), 'Atomic Structure', 'පරමාණුක ව්‍යුහය', 'CHM-1.1'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'Periodic Table', 'ආවර්ත වගුව', 'CHM-1.2'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'Chemical Bonding', 'රසායනික බන්ධන', 'CHM-2.1'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'Stoichiometry', 'ස්ටොයිකියෝමිතිය', 'CHM-3.1'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'Thermochemistry', 'තාප රසායනය', 'CHM-4.1'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'Chemical Kinetics', 'රසායනික චලනය', 'CHM-4.2'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'Chemical Equilibrium', 'රසායනික සමතුලිතතාව', 'CHM-4.3'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'Electrochemistry', 'විද්‍යුත් රසායනය', 'CHM-5.1'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'Organic Chemistry Basics', 'කාබනික රසායනය මූලික', 'CHM-6.1'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'Hydrocarbons', 'හයිඩ්‍රොකාබන', 'CHM-6.2'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'Functional Groups', 'ක්‍රියාකාරී කාණ්ඩ', 'CHM-6.3'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'Reaction Mechanisms', 'ප්‍රතික්‍රියා යාන්ත්‍රණ', 'CHM-6.4'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 's-Block Elements', 's-ගොනු මූලද්‍රව්‍ය', 'CHM-7.1'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'p-Block Elements', 'p-ගොනු මූලද්‍රව්‍ය', 'CHM-7.2'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'd-Block Elements', 'd-ගොනු මූලද්‍රව්‍ය', 'CHM-7.3'),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'Qualitative Analysis', 'ගුණාත්මක විශ්ලේෂණය', 'CHM-8.1');

-- Insert sample papers for 2023

-- Combined Maths Papers
INSERT INTO papers (subject_id, paper_type, year, total_marks, raw_marks, description, duration_minutes) VALUES
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'paper_1', 2023, 100, 1000, 'Combined Mathematics Paper I - Pure Mathematics', 180),
((SELECT id FROM subjects WHERE code = 'combined_maths'), 'paper_2', 2023, 100, 1000, 'Combined Mathematics Paper II - Applied Mathematics', 180);

-- Physics Papers
INSERT INTO papers (subject_id, paper_type, year, total_marks, raw_marks, description, duration_minutes) VALUES
((SELECT id FROM subjects WHERE code = 'physics'), 'paper_1', 2023, 50, 50, 'Physics Paper I - Multiple Choice Questions', 60),
((SELECT id FROM subjects WHERE code = 'physics'), 'paper_2', 2023, 50, 200, 'Physics Paper II - Structured Questions', 180);

-- Chemistry Papers
INSERT INTO papers (subject_id, paper_type, year, total_marks, raw_marks, description, duration_minutes) VALUES
((SELECT id FROM subjects WHERE code = 'chemistry'), 'paper_1', 2023, 50, 50, 'Chemistry Paper I - Multiple Choice Questions', 60),
((SELECT id FROM subjects WHERE code = 'chemistry'), 'paper_2', 2023, 100, 1000, 'Chemistry Paper II - Structured Questions', 180);
