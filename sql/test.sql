--------------------------------------------------
-- WARNING: THIS SCRIPT WILL WIPE THE DATABASE  --
--------------------------------------------------

-- This script is ment to be executed from the project root.
-- Paths embeded in here are relative to that expeted location.
-- example bash command:  sqlite3 my.db < sql/test.sql




SELECT "Resetting database";
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS comment;

-- if we turn this on before the drop sqlite will complain ...
-- turn on use of foreign keys, so deletes cascade
PRAGMA foreign_keys = on;

SELECT "Creating tables";
.read sql/user.sql
.read sql/post.sql
.read sql/comment.sql

SELECT "Inserting data";
INSERT INTO user (username, password) VALUES ("admin5", "$uper$ecret0MG!");
INSERT INTO user (username, password) VALUES ("user7", "$uper$ecret5auce");
INSERT INTO post (user_id, post_text) VALUES (1, "post1(admin5) - Eye NO th!ngs, truest meee!");
INSERT INTO post (user_id, post_text) VALUES (2, "post2(user7) - I'm the best!  I do stuff!");
INSERT INTO comment (post_id, user_id, comment_text) VALUES (1,2, "user7 comment on post 1 - I don't believe your lies admin5");
INSERT INTO comment (post_id, user_id, comment_text) VALUES (2,1, "admin5 comment on post 2 - You're a noob user7!");


SELECT "INSERTs done:";
.mode box
SELECT * FROM user;
SELECT * FROM post;
SELECT * FROM comment;
.mode list

SELECT "Deleting a post but not the comments.  Comments should be deleted automatically (should cascade)";
DELETE FROM post WHERE id = 1;

SELECT "Data after delete post:";
.mode box
SELECT * FROM user;
SELECT * FROM post;
SELECT * FROM comment;
.mode list


SELECT "Deleting user7 but not their post or comment.  All associated records should be be deleted";
DELETE FROM user WHERE id = 2;

SELECT "Data after delete user:";
.mode box
SELECT * FROM user;
SELECT * FROM post;
SELECT * FROM comment;
.mode list

