import { getCommentsDB, insertCommentDB } from "../repository/comments.repository.js";
import { getPostByIdDB } from "../repository/posts.repository.js";

export async function getCommentsByPostId(req, res) {

    const { postId } = req.params
    const user = res.locals.user

    try {

        const post = await getPostByIdDB(postId)

        if (post.rowCount === 0) {
            return res.sendStatus(404)
        }

        const comments = await getCommentsDB(postId,user.id)

        res.send(comments.rows)

    } catch (error) {
        return res.status(500).send(error.message);
    }
}

export async function addComment(req, res) {

    const { comment } = req.body
    const { postId } = req.params
    const user = res.locals.user;

    try {

        const post = await getPostByIdDB(postId)

        if (post.rowCount === 0) {
            return res.sendStatus(404)
        }

        await insertCommentDB(user.id, postId, comment)

        res.sendStatus(201)

    } catch (error) {
        return res.status(500).send(error.message);
    }
}