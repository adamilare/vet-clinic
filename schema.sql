/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY NOT NULL,
    name varchar(100),
    date_of_birth Date,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(10,2)
);

ALTER TABLE IF EXISTS  animals ADD species varchar(255);

DROP TABLE IF EXISTS owners;
CREATE TABLE owners (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name VARCHAR(100),
  age INTEGER
);

DROP TABLE IF EXISTS species;
CREATE TABLE species (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals
ADD species_id INT,
ADD owner_id INT,
ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);
