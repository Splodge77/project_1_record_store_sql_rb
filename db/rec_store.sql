DROP TABLE stock;
DROP TABLE albums;

CREATE TABLE albums(
  id INT4 PRIMARY KEY,
  title VARCHAR(255),
  artist VARCHAR(255)
);

CREATE TABLE stock(
  id INT4 PRIMARY KEY,
  album_id INT4 REFERENCES albums(id),
  quantity INT4 
);
