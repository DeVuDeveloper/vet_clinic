CREATE TABLE animals (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(20),
  date_of_birth date,
  escape_attempts integer,
  neutered boolean,
  weight_kg decimal
);
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(20),
    age integer
);


