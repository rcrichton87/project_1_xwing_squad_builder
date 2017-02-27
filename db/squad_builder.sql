DROP TABLE piloted_ships;
DROP TABLE pilots;
DROP TABLE ships;
DROP TABLE squads;

CREATE TABLE squads(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE ships(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  stats INT2 ARRAY,
  upgrades VARCHAR(255) ARRAY,
  manoeuvres VARCHAR(255),
  faction VARCHAR(255),
  cost INT2
);

CREATE TABLE pilots (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  pilot_skill INT2,
  pilot_ability VARCHAR(255),
  cost INT2,
  ship_id INT4 REFERENCES ships(id) ON DELETE CASCADE
);

CREATE TABLE piloted_ships (
  id SERIAL4 PRIMARY KEY,
  pilot_id INT4 REFERENCES pilots(id) ON DELETE CASCADE,
  ship_id INT4 REFERENCES ships(id) ON DELETE CASCADE,
  squad_id INT4 REFERENCES squads(id) ON DELETE CASCADE
);

