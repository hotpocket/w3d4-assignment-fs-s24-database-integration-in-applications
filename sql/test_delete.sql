SELECT "Data before DELETE:";
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