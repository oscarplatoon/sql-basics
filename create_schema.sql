-- Schema
CREATE TABLE students (
  id           serial PRIMARY KEY,
  first_name   varchar(255) NOT NULL,
  last_name    varchar(255) NOT NULL,
  birthdate    date NOT NULL,
  address_id   integer
);

CREATE TABLE addresses (
  id          SERIAL PRIMARY KEY,
  line_1      varchar(255) NOT NULL,
  city        varchar(255) NOT NULL,
  state_name  varchar(255) NOT NULL,
  zipcode     varchar(64) NOT NULL
);

CREATE TABLE classes (
  id          serial PRIMARY KEY,
  class_name  VARCHAR(255) NOT NULL,
  credits     DECIMAL
);

CREATE TABLE enrollments (
  id          serial PRIMARY KEY,
  student_id  integer,
  class_id    integer,
  grade       decimal
);