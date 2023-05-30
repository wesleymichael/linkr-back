import { dislikeDB, getPostByIdDB, getPostsDB, insertPostDB, likeDB } from "../repository/posts.repository.js";
import { tokenToUser } from "../utils/tokenToUser.js";

export async function createPost(req, res){
    const {description, url} = req.body;
    const session = res.locals.session;
    const user = tokenToUser(session.token);

    try {
        await insertPostDB(user.id, url, description);
        return res.sendStatus(201);        
    } catch (error) {
        return res.status(500).send(error.message);
    }
}

export async function getPosts(req, res){
    const session = res.locals.session;
    const user = tokenToUser(session.token);
    
    try {
        const results = await getPostsDB(user.id);
        return res.send(results.rows);
    } catch (error) {
        return res.status(500).send(error.message);
    }
}

export async function like(req, res){
    const { postId } = req.params;
    const session = res.locals.session;
    const user = tokenToUser(session.token);
    
    try {
        const postResult = await getPostByIdDB(postId);
        if(!postResult.rowCount) return res.status(404).send("Postagem não encontrada!");
        
        const likeResult = await likeDB(postId, user.id);
        if(!likeResult.rowCount) return res.status(409).send("Postagem já curtida!");
        return res.sendStatus(200);
    } catch (error) {
        return res.status(500).send(error.message);
    }
}

export async function dislike(req, res){
    const { postId } = req.params;
    const session = res.locals.session;
    const user = tokenToUser(session.token);

    try {
        const postResult = await getPostByIdDB(postId);
        if(!postResult.rowCount) return res.status(404).send("Postagem não encontrada!");
        
        const dislikeResult = await dislikeDB(postId, user.id);
        if(!dislikeResult.rowCount) return res.status(409).send("Postagem ainda não curtida!");
        return res.sendStatus(200);
    } catch (error) {
        return res.status(500).send(error.message);
    }    
}
