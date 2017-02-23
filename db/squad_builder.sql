DROP TABLE pilots;

CREATE TABLE pilots (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  pilot_skill INT2,
  pilot_ability VARCHAR(255),
  cost INT2,
  ship_type VARCHAR(255)
)

