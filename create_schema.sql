-- Schema
DROP TABLE IF EXISTS students CASCADE;
CREATE TABLE students (
  id           SERIAL PRIMARY KEY,
  first_name   VARCHAR(32) NOT NULL,
  last_name    VARCHAR(32) NOT NULL,
  birthdate    DATE NOT NULL,
  address_id   INTEGER
);

DROP TABLE IF EXISTS addresses CASCADE;
CREATE TABLE addresses (
  id            SERIAL PRIMARY KEY,
  line_1        varchar(64),
  city          varchar(64),
  state         varchar(64),
  zipcode       varchar(64)
);

DROP TABLE IF EXISTS classes CASCADE;
CREATE TABLE classes (
  id            SERIAL PRIMARY KEY,
  name          VARCHAR(255),
  credits       INTEGER
);

DROP TABLE IF EXISTS enrollments CASCADE;
CREATE TABLE enrollments (
  id            SERIAL PRIMARY KEY,
  student_id    INTEGER,
  class_id      INTEGER,
  grade         VARCHAR(2)
);

ALTER TABLE students
ADD CONSTRAINT fk_student_addresses_id
FOREIGN KEY (address_id) REFERENCES addresses(id)

ALTER TABLE enrollments
ADD CONSTRAINT uq_student_classes
UNIQUE (student_id, class_id)