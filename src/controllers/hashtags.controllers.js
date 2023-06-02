import { getTopHashtagsDB, getPostsByHashtagDB } from "../repository/hashtags.repository.js";
import { tokenToUser } from "../utils/tokenToUser.js";

export async function getTrendingTags(req,res){
    try {
        const trending = await getTopHashtagsDB();
        res.send(trending.rows);
    } catch (error) {
        return res.status(500).send(error.message);
    }
}

export async function getHashtagPosts(req,res){
    const session = res.locals.session;
    const user = tokenToUser(session.token);
    try {
        const hashtagPosts = await getPostsByHashtagDB(req.params, user.id);
        res.send(hashtagPosts.rows);
    } catch (error) {
        return res.status(500).send(error.message);
    }
}