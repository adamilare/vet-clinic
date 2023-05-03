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
