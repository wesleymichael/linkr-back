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
    const {hashtag} = params
    return db.query(`
        SELECT posts.* FROM hashtags
            JOIN posts ON posts.id=hashtags."postId"
                WHERE hashtag=$1;`
                ,[hashtag]);
}