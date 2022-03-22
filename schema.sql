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

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name  varchar(20)
);
ALTER TABLE animals ADD PRIMARY KEY (id);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id integer;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id integer;
ALTER TABLE animals ADD CONSTRAINT fk_owner FOREIGN KEY(owner_id) REFERENCES owners(id);
