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
