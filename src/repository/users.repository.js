import { db } from "../database/database.js";

export async function insertUserDB(username, email, password, image) {
    const result = await db.query(`
        INSERT INTO "users" ("username", "email", "password", "image")
        VALUES ($1, $2, $3, $4);    
    `, [username, email, password, image]);
    return result;
}

export function searchUsersByNameDB(name) {
    return db.query(
        `SELECT * FROM users WHERE username ILIKE $1 LIMIT 5;`, [`${name}%`]
    )
}

export async function getUserByEmailDB(email) {
    return await db.query(`
        SELECT * FROM users
        WHERE email=$1
    `, [email])
}

export function getUsersByIdDB(id) {
    return db.query(
        `SELECT * FROM users WHERE id=$1;`, [id]
    )
}

export function followUsers(id, userFollowId) {
    return db.query(`
        INSERT INTO followers ("userId", "followUserId")
        VALUES ($1, $2)
    ;`, [id, userFollowId])
}

export function unfollowUsers(id, userFollowId) {
    return db.query(`
        DELETE FROM followers
        WHERE "userId" = $1
        AND "followUserId" = $2
    ;`, [id, userFollowId])
}

export function followersUsers(id) {
    return db.query(`
        SELECT "followUserId" FROM followers
        WHERE "userId" = $1
    ;`, [id])
}

export function getUsersFollow(id, following) {
    return db.query(`
        SELECT id FROM followers
        WHERE "userId" = $1
        AND "followUserId" = $2
    ;`, [id, following])
}