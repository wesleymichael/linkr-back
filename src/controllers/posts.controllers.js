import { insertPostDB } from "../repository/posts.repository.js";
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