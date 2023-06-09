import { db } from "../database/database.js";

export async function insertCommentDB(userId, postId, comment) {
    return await db.query(
        `INSERT INTO comments ("userId","postId",comment) VALUES ($1,$2,$3);`, [userId, postId, comment]
    )
}

export async function getCommentsDB(postId,userId) {
    return await db.query(
        `SELECT
            c.id,
            c.comment,
            u.id,
            u.username,
            u.image,
            p."userId",
            EXISTS(SELECT * FROM followers WHERE "followUserId"=u.id and "userId"=$2) AS follow
        FROM
            comments c
            JOIN users u ON u.id = c."userId"
            JOIN posts p ON p.id = c."postId"
            LEFT JOIN followers f ON c."userId" = p.id
        WHERE
            c."postId"=$1
        GROUP BY
            u.id,
            c.id,
            p."userId",
            c.comment,
            u.username,
            u.image
        `, [postId,userId]
    )
}