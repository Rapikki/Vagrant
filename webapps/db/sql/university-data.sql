USE university;

INSERT INTO university(name)
VALUES
    ('Massachusetts Institute of Technology')
;

INSERT INTO auditoriums(name, university_id)
VALUES
    ('101', 1),
    ('102', 1),
    ('103', 1),
    ('104', 1),
    ('105', 1),
    ('106', 1),
    ('107', 1),
    ('108', 1),
    ('109', 1),
    ('110', 1),
    ('111', 1),
    ('112', 1),
    ('113', 1),
    ('114', 1)
;

INSERT INTO faculties(name, university_id)
VALUES
    ('Computer Science & Artificial Intelligence Lab', 1),
    ('Materials Science and Engineering', 1),
    ('Economics', 1)
;

INSERT INTO groups(name, faculty_id)
VALUES
    ('SR-01', 1),
    ('SR-02', 2),
    ('SR-03', 3),
    ('SR-04', 1)
;

INSERT INTO students(name, group_id)
VALUES 
    ('David Lambert', 1),
    ('Claire Walker', 1),
    ('Anna Turner', 1),
    ('Melanie Lyman', 1),
    ('Sebastian Taylor', 1),
    ('Grace Sharp', 1),
    ('Theresa Ogden', 1),
    ('Blake Nash', 2),
    ('Gavin Carr', 2),
    ('Joan Paterson', 2),
    ('Carl Young', 2),
    ('Karen Taylor', 2),
    ('Andrea Peters', 2),
    ('Charles Ellison', 2),
    ('Andrew Peters', 3),
    ('Gabrielle Morrison', 3),
    ('Nicholas Jackson', 3),
    ('Steven Alsop', 3),
    ('Sarah Berry', 3),
    ('Diana Morgan', 3),
    ('Alison Wallace', 3),
    ('Robert Vance', 4),
    ('Pippa Campbell', 4),
    ('Anthony Lee', 4),
    ('Leah Russell', 4),
    ('James Clark', 4),
    ('Karen Hamilton', 4),
    ('Bernadette Vance', 4)
; 

INSERT INTO courses(name, description, faculty_id)
VALUES 
    ('Astronomy (ASTRON)', 'Description of research and results in modern extragalactic astronomy and cosmology. We read the stories of discoveries of the principles of our Universe. Simple algebra is used.', 1),
    ('Biology (BIOLOGY)', 'General introduction to cell structure and function, molecular and organismal genetics, animal development, form and function.', 1),
    ('Chemistry (CHEM)', 'Stoichiometry of chemical reactions, quantum mechanical description of atoms, the elements and periodic table, chemical bonding, real and ideal gases, thermochemistry.', 1),
    ('Data Science (DATASCI)', 'This fast-paced course gives students fundamental Python knowledge necessary for advanced work in data science. .', 1),
    ('Economics (ECON)', 'A survey of economics designed to give an overview of the field.', 2),
    ('Geography (GEOG)', 'The global pattern of climate, landforms, vegetation, and soils.', 2),
    ('Health and Medical Sciences (HMEDSCI)', 'Organized group study on topics selected by Health and Medical Sciences faculty for freshman/sophomore students.', 2),
    ('Industrial Engineering and Operations Research (IND ENG)', 'The Berkeley Seminar Program has been designed to provide new students with the opportunity to explore an intellectual topic with a faculty member in a small-seminar setting.', 2),
    ('Landscape Architecture (LD ARCH)', 'This introductory studio course is open to all undergraduate students in the University, who want to investigate the process of drawing as a method to learn how to perceive, observe and represent the environment.', 2),
    ('Mathematics (MATH)', 'An introduction to differential and integral calculus of functions of one variable, with applications and an introduction to transcendental functions.', 3),
    ('Nuclear Engineering (NUC ENG)', 'The Berkeley Seminar Program has been designed to provide new students with the opportunity to explore an intellectual topic with a faculty member in a small-seminar setting.', 3),
    ('Physics (PHYSICS)', 'Kinematics, dynamics, work and energy, rotational motion, oscillations, fluids and relativity.', 3),
    ('Science and Technology Studies (STS)', 'This course provides an overview of the field of Science and Technology Studies (STS) as a way to study how our knowledge and technology shape and are shaped by social, political, historical, economic, and other factors.', 3)
;

INSERT INTO teachers(name, academic_degree, course_id, faculty_id)
VALUES 
    ('Una McLean', 'Ph.D.', 1, 1),
    ('Karen Hudson', 'M.S.', 2, 1),
    ('Nicola Springer', 'Ph.D.', 3, 1),
    ('Angela Vaughan', 'Ed.D.', 4, 1),
    ('Owen Skinner', 'M.S.', 5, 2),
    ('Eric Vance', 'Ph.D.', 6, 2),
    ('Ruth Anderson', 'Ed.D.', 7, 2),
    ('Samantha Ferguson', 'M.S.', 8, 2),
    ('Maria Hardacre', 'Ph.D.', 9, 3),
    ('Cameron McLean', 'M.S.', 10, 3),
    ('Melanie Morgan', 'Ed.D.', 11, 3),
    ('Diana Hill', 'M.S.', 12, 3),
    ('Alison Smith', 'Ph.D.', 13, 3)
; 

INSERT INTO lessons(date_time, course_id, teacher_id, auditorium_id, group_id, university_id)
VALUES 
    ('2000-12-16 09:00:00', 1, 1, 4, 1, 1),
    ('2000-12-16 09:00:00', 2, 2, 3, 2, 1),
    ('2000-12-16 09:00:00', 3, 3, 2, 3, 1),
    ('2000-12-16 09:00:00', 4, 4, 1, 4, 1),
    ('2000-12-16 10:30:00', 5, 5, 8, 1, 1),
    ('2000-12-16 10:30:00', 6, 6, 7, 2, 1),
    ('2000-12-16 10:30:00', 7, 7, 6, 3, 1),
    ('2000-12-16 10:30:00', 8, 8, 5, 4, 1),
    ('2000-12-16 12:00:00', 9, 9, 12, 1, 1),
    ('2000-12-16 12:00:00', 10, 10, 11, 2, 1),
    ('2000-12-16 12:00:00', 11, 11, 10, 3, 1),
    ('2000-12-16 12:00:00', 12, 12, 9, 4, 1),
    ('2000-12-17 09:00:00', 4, 4, 4, 1, 1),
    ('2000-12-17 09:00:00', 2, 2, 3, 2, 1),
    ('2000-12-17 09:00:00', 10, 10, 2, 3, 1),
    ('2000-12-17 09:00:00', 1, 1, 1, 4, 1),
    ('2000-12-17 10:30:00', 8, 8, 8, 1, 1),
    ('2000-12-17 10:30:00', 6, 6, 7, 2, 1),
    ('2000-12-17 10:30:00', 12, 12, 6, 3, 1),
    ('2000-12-17 10:30:00', 5, 5, 5, 4, 1),
    ('2000-12-17 12:00:00', 9, 9, 12, 1, 1),
    ('2000-12-17 12:00:00', 3, 3, 11, 2, 1),
    ('2000-12-17 12:00:00', 11, 11, 10, 3, 1),
    ('2001-01-10 12:00:00', 7, 7, 9, 4, 1),
    ('2001-01-10 09:00:00', 1, 1, 4, 1, 1),
    ('2001-01-10 09:00:00', 2, 2, 3, 2, 1),
    ('2001-01-10 09:00:00', 3, 3, 2, 3, 1),
    ('2001-01-10 09:00:00', 4, 4, 1, 4, 1),
    ('2001-01-10 10:30:00', 5, 5, 8, 1, 1),
    ('2001-01-10 10:30:00', 6, 6, 7, 2, 1),
    ('2001-01-10 10:30:00', 7, 7, 6, 3, 1),
    ('2001-01-10 10:30:00', 8, 8, 5, 4, 1),
    ('2001-01-10 12:00:00', 9, 9, 12, 1, 1),
    ('2001-01-10 12:00:00', 10, 10, 11, 2, 1),
    ('2001-01-10 12:00:00', 11, 11, 10, 3, 1),
    ('2001-01-10 12:00:00', 12, 12, 9, 4, 1),
    ('2001-01-11 09:00:00', 4, 4, 4, 1, 1),
    ('2001-01-11 09:00:00', 2, 2, 3, 2, 1),
    ('2001-01-11 09:00:00', 10, 10, 2, 3, 1),
    ('2001-01-11 09:00:00', 1, 1, 1, 4, 1),
    ('2001-01-11 10:30:00', 8, 8, 8, 1, 1),
    ('2001-01-11 10:30:00', 6, 6, 7, 2, 1),
    ('2001-01-11 10:30:00', 12, 12, 6, 3, 1),
    ('2001-01-11 10:30:00', 5, 5, 5, 4, 1),
    ('2001-01-11 12:00:00', 9, 9, 12, 1, 1),
    ('2001-01-11 12:00:00', 3, 3, 11, 2, 1),
    ('2001-01-11 12:00:00', 11, 11, 10, 3, 1),
    ('2001-01-11 12:00:00', 7, 7, 9, 4, 1)
; 
