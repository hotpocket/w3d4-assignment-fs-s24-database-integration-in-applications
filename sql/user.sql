CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  created_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
