import { dislikeDB, getPostByIdDB, getPostsDB, insertPostDB, likeDB } from "../repository/posts.repository.js";
import { tokenToUser } from "../utils/tokenToUser.js";
import axios from 'axios'; 
import cheerio from 'cheerio';
import { insertNewHashtagsDB } from "../repository/hashtags.repository.js";
import { db } from "../database/database.js";

export async function createPost(req, res){
    const {description, url} = req.body;
    const session = res.locals.session;
    const user = tokenToUser(session.token);
    const filteredHashtags = description
        .match(/#\w+/g)
        ?.filter((value, index, array) => array.indexOf(value) === index)
        .map(v => v.replace('#', ''));

    try {
        const post = await insertPostDB(user.id, url, description);
        if (filteredHashtags) await insertNewHashtagsDB(post.rows[0].id, filteredHashtags);
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

export default async function getMetadata(req, res) {
    const url = req.body.url;
    try {
    const response = await axios.get(url);
    const html = response.data;
    const $ = cheerio.load(html);

    const title = $('head > title').text();
    const description = $('meta[name="description"]').attr('content');
    const imageUrl = $('meta[property="og:image"]').attr('content');

    const metadata = {
      title,
      description,
      imageUrl,
    };

    return res.send(metadata);
  } catch (error) {
    console.error('Erro ao obter metadados:', error);
    return res.send([]);
  }
}

export async function deletePost(req, res){
    const { postId } = req.params;
    const session = res.locals.session;
    const user = tokenToUser(session.token);
    try {        
        const deleteResult = await db.query(`DELETE FROM posts WHERE id=$1 AND "userId"=$2`,[postId,user.id]);
        if(!deleteResult.rowCount){
            const postVerification = await getPostByIdDB(postId);
            if(!postVerification.rowCount) return res.status(404).send("Postagem não encontrada!");
            else return res.status(401).send("Esse post não é seu!");
        } 
        res.sendStatus(200);
    } catch (error) {
        return res.status(500).send(error.message);
    }
}