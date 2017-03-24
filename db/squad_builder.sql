DROP TABLE ship_upgrades;
DROP TABLE piloted_ships;
DROP TABLE pilots;
DROP TABLE ships;
DROP TABLE upgrades;
DROP TABLE squads;

CREATE TABLE squads(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  faction VARCHAR(255)
);

CREATE TABLE upgrades(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  cost INT2,
  effect VARCHAR(255)
);

CREATE TABLE ships(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  stats VARCHAR(255),
  upgrades VARCHAR(255),
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

CREATE TABLE ship_upgrades(
  id SERIAL4 PRIMARY KEY,
  piloted_ship_id INT4 REFERENCES piloted_ships(id) ON DELETE CASCADE,
  upgrade_id INT4 REFERENCES upgrades(id) ON DELETE CASCADE
);