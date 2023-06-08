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
    const user = res.locals.user;
    try {
        const hashtagPosts = await getPostsByHashtagDB(req.params, user.id, req.query);
        res.send(hashtagPosts.rows);
    } catch (error) {
        return res.status(500).send(error.message);
    }
}