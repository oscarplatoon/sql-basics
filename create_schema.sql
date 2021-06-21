-- Schema
DROP TABLE IF EXISTS students CASCADE;
CREATE TABLE students (
  id           serial PRIMARY KEY,
  first_name   varchar(255) NOT NULL,
  last_name    varchar(255) NOT NULL,
  birthdate    date NOT NULL,
  address_id   integer
);

DROP TABLE IF EXISTS addresses CASCADE;
CREATE TABLE addresses (
id            serial PRIMARY KEY, 
line_1        varchar(255) NOT NULL,
city          varchar(255) NOT NULL,
state         varchar(255) NOT NULL,
zipcode       INTEGER
);

DROP TABLE IF EXISTS classes CASCADE;
CREATE TABLE classes (
id            serial PRIMARY KEY,
name          varchar(255) NOT NULL,
credits       varchar(255) NOT NULL
);

DROP TABLE IF EXISTS enrollments CASCADE;
CREATE TABLE enrollments (
id            serial PRIMARY KEY,
student_id    INTEGER,
class_id      INTEGER,
grade         varchar(255)
);

ALTER TABLE enrollments
ADD CONSTRAINT student_id
FOREIGN KEY (student_id) 
REFERENCES students (id);

ALTER TABLE enrollments
ADD CONSTRAINT class_id
FOREIGN KEY (class_id) 
REFERENCES classes (id);