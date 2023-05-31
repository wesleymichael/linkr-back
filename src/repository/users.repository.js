import { db } from "../database/database.js";

export function searchUsersByName(name) {
    return db.query(
        `SELECT * FROM users WHERE username LIKE $1;`,[`${name}%`]
    )
}
