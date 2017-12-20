DROP TABLE stocks;
DROP TABLE albums;
DROP TABLE purchases;

CREATE TABLE albums(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  retail INT4,
  wholesale INT4
);

CREATE TABLE stocks(
  id SERIAL4 PRIMARY KEY,
  album_id INT4 REFERENCES albums(id) ON DELETE CASCADE,
  quantity INT4
);

CREATE TABLE artist(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);
