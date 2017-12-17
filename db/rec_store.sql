DROP TABLE stock;
DROP TABLE albums;

CREATE TABLE albums(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  artist VARCHAR(255)
);

CREATE TABLE stock(
  id SERIAL4 PRIMARY KEY,
  album_id INT4 REFERENCES albums(id) ON DELETE CASCADE,
  quantity INT4
);
