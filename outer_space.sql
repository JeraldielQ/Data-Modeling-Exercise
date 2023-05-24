-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE celestial_objects (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT NOT NULL
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  celestial_object_id INT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  moons TEXT[],
  FOREIGN KEY (celestial_object_id) REFERENCES celestial_objects(id)
);

INSERT INTO celestial_objects (name, type)
VALUES
  ('The Sun', 'Star'),
  ('Earth', 'Planet'),
  ('Mars', 'Planet'),
  ('Venus', 'Planet'),
  ('Neptune', 'Planet'),
  ('Proxima Centauri', 'Star'),
  ('Gliese 876', 'Star');

INSERT INTO planets (celestial_object_id, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  (2, 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
  (3, 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
  (4, 0.62, 'The Sun', 'Milky Way', '{}'),
  (5, 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  (6, 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
  (7, 0.23, 'Gliese 876', 'Milky Way', '{}');
