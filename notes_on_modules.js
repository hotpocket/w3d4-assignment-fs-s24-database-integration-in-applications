////////////////////////////////////////////////////
////////////////////////////////////////////////////
// index.js
'use strict';
import sqlite3 from 'sqlite3';
import {executeSql, readData} from './sqlStuff.js';

async function main() {
    const db = new sqlite3.Database('test.db');
    //await executeSql('CREATE TABLE users (name TEXT, age INT)');
    await executeSql('INSERT INTO users VALUES ("Alice", 42)', db);
    await executeSql('INSERT INTO users VALUES ("Bob", 23)', db);
    const rows = await readData(db);
    console.log(rows);
    db.close();
}


main();

////////////////////////////////////////////////////
////////////////////////////////////////////////////
//sqlStuff.js
export function executeSql(sql, db) {
    return new Promise((resolve, reject) => {
        db.exec(sql, function(err) {
            if (err) {
                reject(err);
            } else {
                resolve();
            }
        });
    });
}

export function readData(db) {
    return new Promise((resolve, reject) => {
        db.all('SELECT * FROM users', function(err, rows) {
            if (err) {
                reject(err);
            } else {
                resolve(rows);
            }
        });
    });
}
