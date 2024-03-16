CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  post_text text,
  CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE -- when a user is deleted, delete all posts associated with that user
);
