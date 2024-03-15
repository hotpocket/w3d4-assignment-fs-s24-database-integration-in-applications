--------------------------------------------------
-- WARNING: THIS SCRIPT WILL WIPE THE DATABASE  --
--------------------------------------------------

-- This script is ment to be executed from the project root.
-- Paths embeded in here are relative to that expeted location.
-- example bash command:  sqlite3 my.db < sql/test.sql

SELECT "Resetting database";
PRAGMA writable_schema = 1;
delete from sqlite_master where type in ("table", "index", "trigger");
PRAGMA writable_schema = 0;

SELECT "Turning on foreign keys";
PRAGMA foreign_keys = on;


SELECT "Creating tables";
.read sql/user.sql
.read sql/comment.sql

SELECT "Inserting data";
INSERT INTO user (username, password) VALUES ("admin5", "$uper$ecret0MG!");
INSERT INTO post (user_id, content) VALUES (1, "post1 - Eye NO th!ngs, truest meee  -admin5");
INSERT INTO comment (post_id, data) VALUES (1, "comment1 - I don't believe your lies admin5");
INSERT INTO user (username, password) VALUES ("user7", "$uper$ecret");
INSERT INTO comment (post_id, data) VALUES (2, "This is a comment by user7");

SELECT "INSERTs done:";
.mode box
SELECT * FROM user;
SELECT * FROM post;
SELECT * FROM comment;
.mode box

SELECT "Testing delete cascade, deleting user 1, but not the associated comment";
DELETE FROM user WHERE id = 1;
.mode box
SELECT * FROM user;
SELECT * FROM comment;
.mode list
