/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN TRANSACTION;
UPDATE animals SET species = 'undefined';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animalS;
ROLLBACK;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animalS WHERE date_of_birth > '2022-1-1';
SAVEPOINT del;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO del;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

SELECT COUNT(*) from animals

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, COUNT(*) as escape_attempts
FROM animals
WHERE escape_attempts > 0
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) 
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-12-31'
GROUP BY species;

SELECT a.name FROM animals a
JOIN owners  ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

SELECT a.*, s.name FROM animals a
JOIN species s  ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.*, a.name FROM owners o
FULL JOIN animals a ON a.owner_id = o.id;

SELECT s.name, COUNT(*) AS Counts
FROM animals a 
JOIN species s ON a.species_id = s.id
GROUP BY s.name;

SELECT a.name, o.full_name FROM animals a
JOIN species s
ON s.id = a.species_id 
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

SELECT a.name, a.escape_attempts
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE a.escape_attempts = 0 AND o.full_name = 'Dean Winchester';

SELECT o.full_name,  COUNT(*) AS highest_count
FROM animals a
JOIN owners o ON a.owner_id = o.id
GROUP BY o.full_name
ORDER BY highest_count ASC;
