const sqlite3 = require('sqlite3').verbose();
let db = new sqlite3.Database('test.sqlite');
var fs = require('fs');

// wrap the db.exec and db.all funcitons so we can have sync execution of our sql

function exec(sql) {
  return new Promise((resolve, reject) => {
      db.exec(sql, (err) => err ? reject(err) : resolve() )
  });
}

function all(sql) {
  return new Promise((resolve, reject) => {
      db.all(sql, (err, rows) => err ? reject(err) : resolve(rows) );
  });
}

// run our sql
async function main() {
  // create the tables and seed them with data
  console.log("\nCREATING TABLES & SEEDING WITH DATA ...");
  let files = ["test_drop", "user", "post", "comment", "test_insert"]
  for (let i = 0; i < files.length; i++) {
    await exec(fs.readFileSync(`sql/${files[i]}.sql`).toString());
  }

  // read/select all the records from all these tables
  console.log("\nREADING TABLE DATA...");
  let tables = ['user', 'post', 'comment']
  for(let i = 0; i < tables.length; i++) {
    console.log(`DATA FROM TABLE: ${tables[i]}`);
    await all(`SELECT * FROM ${tables[i]};`).then(rows => {
      rows.forEach((row) => console.log(row));
    });
  }

  // demo a sql join of all tables
  let joinQuery = "SELECT user.id, user.username, post.id, post.post_text, comment.comment_text " +
    "FROM user " +
    "JOIN post ON user.id = post.user_id " +
    "JOIN comment ON comment.post_id = comment.id " +
    "WHERE user.id = (SELECT max(id) FROM user);"

  console.log("\nJOIN RESULTS...");
  await all(joinQuery).then(rows => {
    rows.forEach((row) => console.log(row));
  });

}

main();



