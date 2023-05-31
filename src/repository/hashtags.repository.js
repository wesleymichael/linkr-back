import { db } from "../database/database.js";

export function insertNewHashtagsDB(postId,filteredHashtags){
    return db.query(
        `INSERT INTO hashtags ("postId", hashtag) 
            VALUES($1, unnest(array[$2::text[]]));`
        ,[postId, filteredHashtags]); 
}