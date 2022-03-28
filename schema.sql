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


CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name varchar(20),
  age integer,
  date_of_graduation dategit branch
);
CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  species_id integer,
  vet_id integer,
  CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id),
  CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id)
);
CREATE TABLE visits (
  visit_id SERIAL PRIMARY KEY,
  animal_id integer,
  vet_id integer,
  date_of_visit date,
  CONSTRAINT fk_animals FOREIGN KEY(animal_id) REFERENCES animals(id),
  CONSTRAINT fk_vets FOREIGN KEY(vet_id) REFERENCES vets(id)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animal_index on visits (animal_id ASC);

CREATE INDEX vet_index on visits (vet_id ASC);

CREATE INDEX email_index on owners (email ASC);
