-- Schema
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS addresses CASCADE;
DROP TABLE IF EXISTS classes CASCADE;
DROP TABLE IF EXISTS enrollments CASCADE;

CREATE TABLE students (
  id           serial PRIMARY KEY,
  first_name   varchar(32) NOT NULL,
  last_name    varchar(32) NOT NULL,
  birthdate    date NOT NULL,
  address_id   integer
);

CREATE TABLE addresses (
  id            serial PRIMARY KEY,
  line_1        varchar(255) NOT NULL, 
  city          varchar(255) NOT NULL,
  state         varchar(20)NOT NULL,
  zipcode       varchar(6) NOT NULL
);

CREATE TABLE classes (
  id            serial PRIMARY KEY,
  name          varchar(255),
  credits       integer                
);

CREATE TABLE enrollments (
  id            serial PRIMARY KEY,
  student_id    integer REFERENCES student(id),
  class_id      integer REFERENCES classes(id),
  grade         varchar(2)
);

ALTER TABLE enrollments
ADD CONSTRAINT student_id
FOREIGN KEY (student_id)
REFERENCES students;

ALTER TABLE enrollments
ADD CONSTRAINT class_id
FOREIGN KEY (class_id)
REFERENCES classes;