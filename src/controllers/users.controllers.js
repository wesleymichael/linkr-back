import { getPostByIdDB, getPostByUserIdDB, getPostsDB } from "../repository/posts.repository.js";
import { getUsersByIdDB, searchUsersByNameDB } from "../repository/users.repository.js";

export async function searchUsers(req, res) {

    const { name } = req.body

    try {
        const users = await searchUsersByNameDB(name)

        for (let i = 0; i < users.rowCount; i++) {
            delete users.rows[i].password
            delete users.rows[i].email
        }

        res.send(users.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function userById(req, res) {

    const { id } = req.params

    try {
        const user = await getUsersByIdDB(id)

        if (user.rowCount === 0) {
            return res.sendStatus(404)
        }

        delete user.rows[0].password
        delete user.rows[0].email

        const posts = await getPostByUserIdDB(id)

        res.send({ user: user.rows[0], posts: posts.rows });
    } catch (error) {
        res.status(500).send(error.message);
    }
}