import { db } from "../database/database.js";

export async function repost(req, res) {
    const { postId } = req.params
    try {

        const user = res.locals.user;
        const result = await db.query(`INSERT INTO reposts ("userId","postId") VALUES ($1, $2)`,[user.id,postId])
        res.send('respostado! o post '+postId)

    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function unrepost(req, res) {
    const { postId } = req.params
    try {

        const user = res.locals.user;
        const result = await db.query(`DELETE FROM reposts WHERE "userId"=$1 AND "postId"=$2`,[user.id,postId])
        res.send('desrespostado! o post '+postId)

    } catch (error) {
        res.status(500).send(error.message);
    }
}