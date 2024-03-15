CREATE TABLE IF NOT EXISTS comment (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  data text,
  CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES user (id)
  ON DELETE CASCADE -- when a user is deleted, delete all comments associated with that user
);
