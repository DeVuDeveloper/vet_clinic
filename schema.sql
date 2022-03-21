CREATE TABLE animals (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(20),
  date_of_birth date,
  escape_attempts integer,
  neutered boolean,
  weight_kg decimal
);
ALTER TABLE animals ADD species varchar(20);