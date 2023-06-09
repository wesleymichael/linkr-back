import { db } from "../database/database.js";

export async function insertCommentDB(userId, postId, comment) {
    return await db.query(
        `INSERT INTO comments ("userId","postId",comment) VALUES ($1,$2,$3);`, [userId, postId, comment]
    )
}

export async function getCommentsDB(postId) {
    return await db.query(
        `SELECT
            c.id,
            c.comment,
            u.username,
            u.image
        FROM
            comments c
            JOIN users u ON u.id = c."userId"
        WHERE
            c."postId"=$1
        GROUP BY
            c.id,
            c.comment,
            u.username,
            u.image
        `, [postId]
    )
}