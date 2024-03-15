CREATE TABLE comment (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  post_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  content text,
  -- when a post is deleted, delete all comments associated with that post
  CONSTRAINT post_fk FOREIGN KEY (post_id) REFERENCES post (id) ON DELETE CASCADE,
  -- but when a user is deleted, keep the comments (no DELETE CASCADE)
  CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES user (id)
);
