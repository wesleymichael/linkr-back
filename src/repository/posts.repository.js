import { db } from "../database/database.js";

export async function insertPostDB(userId, url, description){
    const results = db.query(`
        INSERT INTO "posts" ("userId", "url", "description") 
            VALUES ($1, $2, $3);`
    , [userId, url, description]);
    return results;
}

export async function getPostsDB(userId){
    const results = await db.query(`
        SELECT
            u.username,
            u.image,
            json_build_object(
                'id', p.id,
                'url', p.url,
                'description', p.description,
                'createdAt', p."createdAt",
                'likes', COUNT(l.id),
                'liked', EXISTS(SELECT 1 FROM likes WHERE "postId" = p.id AND "userId" = $1)
            ) AS post,
            json_agg(h.hashtag) AS hashtags
        FROM
            users u
            JOIN posts p ON u.id = p."userId"
            LEFT JOIN likes l ON p.id = l."postId"
            LEFT JOIN hashtags h ON p.id = h."postId"
        GROUP BY
            u.username,
            u.image,
            p.id,
            p.url,
            p.description,
            p."createdAt"
        ORDER BY
            p."createdAt" DESC;
        `, [userId]);
    return results;
}

export async function likeDB(postId, userId){
    const results = await db.query(`
    INSERT INTO likes ("userId", "postId")
        SELECT $2, $1
        WHERE NOT EXISTS (
            SELECT 1
            FROM likes
            WHERE "userId" = $2 AND "postId" = $1
        )
    RETURNING *;
    `, [postId, userId]);
    return results;
}

export async function dislikeDB(postId, userId){
    return await db.query(`
        DELETE FROM likes
            WHERE "userId" = $2 AND "postId" = $1;
    `, [postId, userId]);
}

export async function getPostByIdDB(postId){
    return await db.query(`SELECT * FROM posts WHERE id = $1;`, [postId]);
}