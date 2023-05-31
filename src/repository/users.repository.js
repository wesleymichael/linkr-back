import { db } from "../database/database.js";

export function searchUsersByNameDB(name) {
    return db.query(
        `SELECT * FROM users WHERE username LIKE $1;`,[`${name}%`]
    )
}

export function getUsersByIdDB(id){
    return db.query(
        `SELECT * FROM users WHERE id=$1;`,[id]
    )
}