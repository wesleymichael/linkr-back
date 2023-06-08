import { db } from "../database/database.js";

export async function insertCommentDB(userId, postId, comment) {
    return await db.query(
        `INSERT INTO comments ("userId","postId",comment) VALUES ($1,$2,$3);`, [userId, postId, comment]
    )
}

export async function getCommentsDB(postId){
    return await db.query(
        `SELECT * FROM comments WHERE "postId"=$1`,[postId]
    )
}