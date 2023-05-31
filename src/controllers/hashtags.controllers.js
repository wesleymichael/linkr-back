import { getTopHashtagsDB, getPostsByHashtagDB } from "../repository/hashtags.repository.js";

export async function getTrendingTags(req,res){
    try {
        const trending = await getTopHashtagsDB();
        res.send(trending.rows);
    } catch (error) {
        return res.status(500).send(error.message);
    }
}

export async function getHashtagPosts(req,res){    
    try {
        const hashtagPosts = await getPostsByHashtagDB(req.params);
        res.send(hashtagPosts.rows);
    } catch (error) {
        return res.status(500).send(error.message);
    }
}