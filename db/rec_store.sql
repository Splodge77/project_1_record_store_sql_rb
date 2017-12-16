DROP TABLE albums;
DROP TABLE artists;
DROP TABLE stock;

CREATE TABLE albums(
  id INT4 PRIMARY KEY,
  title VARCHAR(255),
  artist_id INT4 REFERENCES artists(id)
);

CREATE TABLE artists(
  id INT4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE stock(
  id INT4 PRIMARY KEY,
  album_id REFERENCES albums(id)
);
