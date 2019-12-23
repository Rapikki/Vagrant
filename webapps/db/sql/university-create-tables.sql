USE university;

CREATE TABLE IF NOT EXISTS university (
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    name character varying(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS auditoriums (
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    name character(10) NOT NULL,
    university_id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (university_id)
        REFERENCES university(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS faculties (
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    name character varying(100) NOT NULL,
    university_id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (university_id)
        REFERENCES university(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS courses (
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    name character varying(100) NOT NULL,
    description character varying(255) NOT NULL,
    faculty_id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (faculty_id)
        REFERENCES faculties(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS teachers (
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    name character varying(100) NOT NULL,
    academic_degree character varying(100) NOT NULL,
    course_id integer NOT NULL,
    faculty_id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id)
        REFERENCES courses (id) ON DELETE CASCADE,
    FOREIGN KEY (faculty_id)
        REFERENCES faculties (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS groups (
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    name character(10) NOT NULL,
    faculty_id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (faculty_id)
        REFERENCES faculties (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS students (
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    name character varying(100) NOT NULL,
    group_id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id)
        REFERENCES groups (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS lessons (
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    date_time timestamp NOT NULL,
    course_id integer NOT NULL,
    teacher_id integer NOT NULL,
    auditorium_id integer NOT NULL,
    group_id integer NOT NULL,
    university_id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id)
        REFERENCES courses (id) ON DELETE CASCADE,
    FOREIGN KEY (teacher_id)
        REFERENCES teachers (id) ON DELETE CASCADE,
    FOREIGN KEY (auditorium_id)
        REFERENCES auditoriums (id) ON DELETE CASCADE,
    FOREIGN KEY (group_id)
        REFERENCES groups (id) ON DELETE CASCADE,
    FOREIGN KEY (university_id)
        REFERENCES university (id) ON DELETE CASCADE
);
