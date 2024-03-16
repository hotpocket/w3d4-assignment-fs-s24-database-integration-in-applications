SELECT "Resetting database";
.read test_drop.sql

-- if we turn this on before the drop sqlite will complain ...
-- turn on use of foreign keys, so deletes cascade
PRAGMA foreign_keys = on;

SELECT "Creating tables";
.read user.sql
.read post.sql
.read comment.sql

SELECT "Inserting some dummy records:";
.read test_insert.sql
SELECT "Doing some deletes to test cascade functionality";
.read test_delete.sql



