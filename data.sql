/* Populate database with sample data. */

INSERT INTO animals(Id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (1, 'Agumon', '2020-2-3' ,0, true, 10.23),
			(2, 'Gabumon', '2018-11-15', 2, true, 8),
			(3, 'Pikachu', '2021-1-7', 1, false, 15.04),
			(4, 'Devimon', '2017-5-12', 5, true, 11);

INSERT INTO animals(Id, name, date_of_birth, weight_kg, neutered, escape_attempts )
	VALUES (5, 'Charmander', '2020-2-8' ,-11, false, 0),
			(6, 'Plantmon', '2021-11-15', -5.7, true, 2),
			(7, 'Squirtle', '1993-4-2', -12.13, false, 3),
			(8, 'Angemon', '2005-6-12', -45, true, 1),
			(9, 'Boarmon', '2005-6-7', 20.4, true, 7),
			(10, 'Blossom', '1998-10-13', 17, true, 3),
			(11, 'Ditto', '2022-5-14', 22, true, 4);

INSERT INTO owners(full_name, age) 
	VALUES ('Sam Smith', 34),
			('Jennifer Orwell', 19),
			('Bob', 45),
			('Melody Pond', 77),
			('Dean Winchester', 14),
			('Jodie Whittaker', 38);

UPDATE animals
SET species_id = CASE
WHEN name LIKE '%mon%' THEN (SELECT id FROM species WHERE name = 'Digimon')
ELSE(SELECT id FROM species WHERE name = 'Pokemon')
END;

UPDATE animals
SET owner_id = CASE
WHEN name = 'Agumon' THEN(SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHEN name IN ('Gabumon', 'Pikachu') THEN(SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHEN name IN ('Devimon', 'Plantmon') THEN(SELECT id FROM owners WHERE full_name = 'Bob')
WHEN name IN('Charmander', 'Squirtle','Blossom') THEN(SELECT id  FROM owners WHERE full_name = 'Melody Pond')
WHEN name IN('Angemon', 'Boarmon') THEN(SELECT id FROM owners WHERE full_name = 'Dean Winchester')
END;
