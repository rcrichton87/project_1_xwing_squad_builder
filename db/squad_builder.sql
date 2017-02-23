DROP TABLE pilots;
DROP TABLE ships;

CREATE TABLE ships(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  stats INT2 ARRAY,
  upgrades VARCHAR(255) ARRAY,
  manoeuvres VARCHAR(255),
  faction VARCHAR(255)
);

CREATE TABLE pilots (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  pilot_skill INT2,
  pilot_ability VARCHAR(255),
  cost INT2,
  ship_type VARCHAR(255)
);

