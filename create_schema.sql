-- Schema
DROP TABLE IF EXISTS students CASCADE;
CREATE TABLE students (
  id           serial PRIMARY KEY,
  first_name   varchar(255) NOT NULL,
  last_name    varchar(255) NOT NULL,
  birthdate    date NOT NULL,
  address_id   integer
);

DROP TABLE IF EXISTS addresses;
CREATE TABLE addresses (
id            serial PRIMARY KEY,
line_1        varchar(255),
city          varchar(255),
state         varchar(40),
zipcode       varchar(10)
);

DROP TABLE IF EXISTS classes;
CREATE TABLE classes (
id      serial PRIMARY KEY,
name    varchar(255),
credits integer
);

DROP TABLE IF EXISTS enrollments;
CREATE TABLE enrollments (
id            serial PRIMARY KEY,
student_id    integer,
class_id      integer,
grade         varchar(10)
);

ALTER TABLE students ADD CONSTRAINT
"fk_students_address_id" FOREIGN KEY("address_id")
REFERENCES addresses("id");

ALTER TABLE enrollments ADD CONSTRAINT
"fk_enrollment_student_id" FOREIGN KEY("student_id")
REFERENCES students("id");

ALTER TABLE enrollments ADD CONSTRAINT
"fk_enrollment_class_id" FOREIGN KEY("class_id")
REFERENCES classes("id");
