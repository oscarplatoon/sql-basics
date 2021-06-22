-- Schema
DROP TABLE IF EXISTS students CASCADE;
CREATE TABLE students (
  id           serial PRIMARY KEY,
  first_name   varchar(32) NOT NULL,
  last_name    varchar(32) NOT NULL,
  birthdate    date NOT NULL,
  address_id   integer
);

DROP TABLE IF EXISTS addresses CASCADE;
CREATE TABLE addresses (
  id          SERIAL PRIMARY KEY,
  line_1      varchar(64) NOT NULL,
  city        varchar(32) NOT NULL,
  state_name  varchar(16) NOT NULL,
  zipcode     varchar(64) NOT NULL
);

DROP TABLE IF EXISTS classes CASCADE;
CREATE TABLE classes (
  id          serial PRIMARY KEY,
  class_name  VARCHAR(32) NOT NULL,
  credits     DECIMAL
);

DROP TABLE IF EXISTS enrollments CASCADE;
CREATE TABLE enrollments (
  id          serial PRIMARY KEY,
  student_id  integer,
  class_id    integer,
  grade       VARCHAR(8)
);

ALTER TABLE students
ADD CONSTRAINT fk_student_address_id
FOREIGN KEY(address_id) 
REFERENCES addresses(id);

ALTER TABLE enrollments
ADD CONSTRAINT rel_student_class_id UNIQUE(student_id, class_id);
