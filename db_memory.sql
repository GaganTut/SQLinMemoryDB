DROP DATABASE IF EXISTS db_memory;

CREATE DATABASE db_memory;

\c db_memory;

DROP TABLE IF EXISTS users;

CREATE TYPE genderOnly AS ENUM ('m', 'f');

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  age INTEGER NOT NULL,
  gender genderOnly NOT NULL,
  employerId VARCHAR(2) DEFAULT 'na'
);

DROP TABLE IF EXISTS employer;

CREATE TABLE employer (
  employerId VARCHAR(2) NOT NULL,
  employerName VARCHAR(30) NOT NULL
);

INSERT INTO users (name, age, gender, employerId)
  VALUES ('Alice', 12, 'f', 'st'),
  ('Bob', 21, 'm', 'dv'),
  ('Claire', 56, 'f', 'dv'),
  ('David', 9, 'm', 'na'),
  ('Eric', 61, 'm', 'dv'),
  ('Fred', 45, 'm', 'dv'),
  ('George', 38, 'm', 'dv'),
  ('Hannah', 15, 'f', 'na'),
  ('Ilona', 17, 'f', 'st'),
  ('Jake', 27, 'm', 'dv'),
  ('Kathy', 8, 'f', 'na'),
  ('Liam', 20, 'm', 'st');

INSERT INTO employer (employerId, employerName)
  VALUES
    ('dv', 'DevLeague'),
    ('st', 'Student'),
    ('na', 'N/A');

SELECT * FROM users
  WHERE id = 5;

SELECT MIN(age) FROM users;

SELECT MAX(age) FROM users;

SELECT * FROM users
  WHERE gender = 'm';

SELECT * FROM users
  WHERE gender = 'f';

SELECT * FROM users
  INNER JOIN employer USING (employerId)
  WHERE employerId = 'na';