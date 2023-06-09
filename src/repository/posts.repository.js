import { db } from "../database/database.js";

export async function insertPostDB(userId, url, description) {
    const results = db.query(`
        INSERT INTO "posts" ("userId", "url", "description") 
            VALUES ($1, $2, $3)
            RETURNING id;`
        , [userId, url, description]);
    return results;
}

export async function getPostsDB(userId, query) {
    const firstPostReference = query.firstPost ? query.firstPost : "Infinity";
    const pageOffset = query.page > 0 ? ((query.page) - 1) * 10 : 0;
    const results = await db.query(`
        SELECT
            u.id,
            u.username,
            u.image,
            json_build_object(
                'id', p.id,
                'url', p.url,
                'description', p.description,
                'createdAt', p."createdAt",
                'likes', COUNT(l.id),
                'liked', EXISTS(SELECT 1 FROM likes WHERE "postId" = p.id AND "userId" = $1),
                'diffUser',(SELECT u.username FROM likes l
                    JOIN users u ON u.id=l."userId"
                    WHERE l."postId"=p.id AND "userId" <> $1
                    ORDER BY l."createdAt" DESC
                    LIMIT 1)
            ) AS post,
            COUNT(c.id) AS comments
        FROM
            users u
            JOIN posts p ON u.id = p."userId"
            LEFT JOIN likes l ON p.id = l."postId"
            LEFT JOIN comments c ON p.id = c."postId"
        WHERE
            p.id <= $2::float
            AND p."userId" = ANY(array(
				SELECT "followUserId" FROM followers WHERE "userId"=$1
				))
            OR p."userId"=$1
        GROUP BY
            u.id,
            u.username,
            u.image,
            p.id,
            p.url,
            p.description,
            p."createdAt"
        ORDER BY
            p."createdAt" DESC
        OFFSET $3
        LIMIT 10; 
        `, [userId, firstPostReference, pageOffset]);
    return results;
}

export async function likeDB(postId, userId) {
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

export async function dislikeDB(postId, userId) {
    return await db.query(`
        DELETE FROM likes
            WHERE "userId" = $2 AND "postId" = $1;
    `, [postId, userId]);
}

export async function getPostByIdDB(postId) {
    return await db.query(`SELECT * FROM posts WHERE id = $1;`, [postId]);
}

export async function getPostByUserIdDB(userId, userLikerId, query) {
    const firstPostReference = query.firstPost ? query.firstPost : "Infinity";
    const pageOffset = query.page > 0 ? ((query.page) - 1) * 10 : 0;
    const results = await db.query(`
        SELECT
            u.id,
            u.username,
            u.image,
            json_build_object(
                'id', p.id,
                'url', p.url,
                'description', p.description,
                'createdAt', p."createdAt",
                'likes', COUNT(l.id),
                'liked', EXISTS(SELECT 1 FROM likes WHERE "postId" = p.id AND "userId" = $2),
                'diffUser',(SELECT u.username FROM likes l
                    JOIN users u ON u.id=l."userId"
                    WHERE l."postId"=p.id AND "userId" <> $2
                    ORDER BY l."createdAt" DESC
                    LIMIT 1)
            ) AS post,
            COUNT(c.id) AS comments
        FROM
            users u
            JOIN posts p ON u.id = p."userId"
            LEFT JOIN likes l ON p.id = l."postId"
            LEFT JOIN comments c ON p.id = c."postId"
        WHERE
            p."userId" = $1 AND p.id <= $3::float
        GROUP BY
            u.id,
            u.username,
            u.image,
            p.id,
            p.url,
            p.description,
            p."createdAt"
        ORDER BY
            p."createdAt" DESC
        OFFSET $4
        LIMIT 10;
        `, [userId, userLikerId, firstPostReference, pageOffset]);
    return results;
}

export async function deletePostById(params, userId) {
    const { postId } = params;
    return await db.query(`DELETE FROM posts WHERE id=$1 AND "userId"=$2`, [postId, userId]);
}

export async function deleteHashtagsByPostId(params) {
    const { postId } = params;
    return await db.query(`DELETE FROM hashtags WHERE "postId"=$1`, [postId]);
}

export async function updatePostById(description, postId) {
    return db.query(`UPDATE posts SET description=$1 WHERE id=$2`, [description, postId]);
}

export async function getNewestPostsByTimestamp(body, userId) {
    const { lastCreatedAt } = body;
    return db.query(`
    SELECT COUNT(*) FROM posts 
	WHERE posts."createdAt" > $1 
		AND posts."userId" = ANY(array(
			SELECT "followUserId" FROM followers WHERE "userId"=$2
			));`,[lastCreatedAt, userId])
    
}