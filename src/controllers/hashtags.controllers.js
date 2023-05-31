import { db } from "../database/database.js";

export async function getTrendingTags(req,res){
    try {
        const trending = await db.query(`
        SELECT hashtag FROM hashtags
                GROUP BY hashtag
                ORDER BY COUNT(*) DESC
                LIMIT 10;
        `);
        res.send(trending.rows);
    } catch (error) {
        return res.status(500).send(error.message);
    }
}

export async function getHashtagPosts(req,res){
    const {hashtagId} = req.params
    try {
        res.send(`Receba todos os posts com a hashtag #${hashtagId}`);
    } catch (error) {
        return res.status(500).send(error.message);
    }
}