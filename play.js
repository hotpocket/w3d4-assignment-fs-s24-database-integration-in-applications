const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('mydatabase.db');

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

async function main() {
  await all();
}

main();


// Example usage with async/await
(async () => {
    const createTableSql = 'CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT)';
    const selectSql = 'SELECT * FROM users';

    try {
        await executeSql(createTableSql);
        console.log('Table created successfully');

        const users = await readData();
        console.log('Users:', users);
    } catch (err) {
        console.error('Error:', err);
    } finally {
        // Close the database connection
        db.close();
    }
})();