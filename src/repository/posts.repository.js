import { db } from "../database/database.js";

export async function insertPostDB(userId, url, description){
    const results = db.query(`
        INSERT INTO "posts" ("userId", "url", "description") 
            VALUES ($1, $2, $3);`
    , [userId, url, description]);
    return results;
}
