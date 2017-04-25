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
  abbreviation VARCHAR(2) NOT NULL,
  name VARCHAR(30) NOT NULL
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

INSERT INTO employer (abbreviation, name)
  VALUES
    ('dv', 'DevLeague'),
    ('st', 'Student'),
    ('na', 'N/A');

SELECT * FROM users;
