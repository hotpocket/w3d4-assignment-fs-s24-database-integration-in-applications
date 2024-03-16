import sqlite3
from pathlib import Path

# create schema, add, and then read some data
# see/run test.sh for a more robust test that that includes delete cascades

con = sqlite3.connect("test.sqlite3")
con.row_factory = sqlite3.Row  # to return rows as dictionaries
cur = con.cursor()

# ensure blank slate
cur.executescript(Path('sql/test_drop.sql').read_text())

# create tables
cur.execute(Path('sql/user.sql').read_text())
cur.execute(Path('sql/post.sql').read_text())
cur.execute(Path('sql/comment.sql').read_text())

# add some data
cur.executescript(Path('sql/test_insert.sql').read_text())

# read the data back out
tables = ['user', 'post', 'comment']
for table in tables:
    print(f"Records in {table}:")
    cur.execute(f"SELECT * FROM {table}")
    for row in cur.fetchall():
        print(dict(row)) # we still have to cast it =\

con.close()
