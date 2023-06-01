import { db } from "../database/database.js";

export function insertNewHashtagsDB(postId,filteredHashtags){
    return db.query(
        `INSERT INTO hashtags ("postId", hashtag) 
            VALUES($1, unnest(array[$2::text[]]));`
        ,[postId, filteredHashtags]); 
}

export function getTopHashtagsDB(){
    return db.query(`
        SELECT hashtag FROM hashtags
                GROUP BY hashtag
                ORDER BY COUNT(*) DESC
                LIMIT 10;
    `);
}

export function getPostsByHashtagDB(params){
    /*
    A ROTA ESTÁ SEM VERIFICAÇÃO DE LIKES. Quando for adicionada autenticação,
    recuperar o id do usuário aqui e utilizar no comando EXISTS().
    */
    const {hashtag} = params
    return db.query(`
    SELECT
        u.username,
        u.image,
        json_build_object(
            'id', p.id,
            'url', p.url,
            'description', p.description,
            'createdAt', p."createdAt",
            'likes', COUNT(l.id),
            'liked', EXISTS(SELECT 1 FROM likes WHERE "postId" = p.id AND "userId" = 1)
        ) AS post,
        json_agg(h.hashtag) AS hashtags
    FROM
        users u 
        JOIN posts p ON u.id = p."userId"
        LEFT JOIN likes l ON p.id = l."postId"
        LEFT JOIN hashtags h ON p.id = h."postId"        
        WHERE h.hashtag=$1
    GROUP BY
        u.username,
        u.image,
        p.id,
        p.url,
        p.description,
        p."createdAt"
    ORDER BY
        p."createdAt" DESC;
        `
        ,[hashtag]);
}