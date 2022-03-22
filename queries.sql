SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '2019-01-12';
SELECT name FROM animals WHERE neutered='true' AND escape_attempts < 3;
SELECT date_of_birth, name FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered='true';
SELECT * FROM animals WHERE NOT name='Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
BEGIN;
UPDATE animals SET species='unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

SELECT * FROM animals;
UPDATE animals SET species='pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
BEGIN;
DELETE FROM animals;
ROLLBACK;
COMMIT; 
SELECT * FROM animals;
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
SAVEPOINT deleted_ditto;
UPDATE animals SET weight_kg = -1 * weight_kg;
SELECT * FROM animals;
ROLLBACK TO deleted_ditto;
SELECT * FROM animals;
UPDATE animals SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;
--above Update will not works, explanations in PR
COMMIT;
SELECT COUNT(*) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT MAX(escape_attempts) FROM animals;
--neutered Boarmon with 7 escape_attempts
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31' GROUP BY species;

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.id = 4;
SELECT animals.name FROM animals JOIN species on species.id = animals.species_id where species.id = 2;
SELECT animals.name, owners.fulL_name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
SELECT species.name, COUNT(*) FROM animals JOIN species ON species.id = animals.species_id GROUP BY species.name;
SELECT animals.name, owners.full_name, species.name FROM animals
JOIN species ON species.id = animals.species_id
JOIN owners ON owners.id = animals.owner_id
WHERE owners.id = 2 AND species.name = 'Digimon' ;
SELECT * FROM animals JOIN owners ON animals.owner_id = owners.id 
WHERE animals.escape_attempts = 0 AND owners.id = 5;
SELECT owners.full_name, COUNT(*) AS count FROM owners JOIN animals ON animals.owner_id=owners.id
GROUP BY owners.id ORDER BY count DESC limit 1;

SELECT animals.name, vets.name, visits.date_of_visit FROM vets
JOIN visits ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animal_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC LIMIT 1;
SELECT COUNT(animal_id) FROM visits WHERE vet_id = 3;
SELECT specializations.species_id, vets.name FROM vets FULL JOIN specializations ON specializations.vet_id=vets.id;
SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.id =3  AND visits.date_of_visit >= '2020-04-01' AND visits.date_of_visit <= '2020-08-30';
SELECT name, COUNT(*) AS count_of_visits FROM animals JOIN visits ON animals.id=visits.animal_id
GROUP BY name ORDER BY count_of_visits DESC LIMIT 1;



