import { db } from "../database/database.js";
import { getPostByUserIdDB } from "../repository/posts.repository.js";
import { followUsers, followersUsers, getUsersByIdDB, getUsersFollow, searchUsersByNameDB, unfollowUsers } from "../repository/users.repository.js";
import { tokenToUser } from "../utils/tokenToUser.js";

export async function searchUsers(req, res) {

    const { name, token } = req.body

    try {
        const user = tokenToUser(token)
        const users = await searchUsersByNameDB(name)
        const usersId = []
        const followers = []

        for (let i = 0; i < users.rowCount; i++) {
            delete users.rows[i].password
            delete users.rows[i].email

            usersId.push(users.rows[i].id)
        }

        for (let i = 0; i < usersId.length; i++) {
            const follow = await getUsersFollow(user.id, usersId[i])
            if (follow.rows[0]) {
                followers.push({ ...users.rows[i], follower: follow.rows[0].follow })
            } else {
                followers.push({ ...users.rows[i], follower: false })
            }
        }

        res.send(followers);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function userById(req, res) {

    const { id } = req.params

    try {
        const session = res.locals.session;
        const userLiker = tokenToUser(session.token);
        const user = await getUsersByIdDB(id)

        if (user.rowCount === 0) {
            return res.sendStatus(404)
        }

        delete user.rows[0].password
        delete user.rows[0].email

        const posts = await getPostByUserIdDB(id, userLiker.id)

        res.send({ user: user.rows[0], posts: posts.rows });
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function follow(req, res) {
    const { followId } = req.body
    try {

        const session = res.locals.session;
        const user = tokenToUser(session.token);

        await followUsers(user.id, followId)

        res.sendStatus(200)

    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function unfollow(req, res) {
    const { followId } = req.body
    try {

        const session = res.locals.session;
        const user = tokenToUser(session.token);

        await unfollowUsers(user.id, followId)

        res.sendStatus(200)
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function followers(req, res) {
    try {

        const session = res.locals.session;
        const user = tokenToUser(session.token);

        const follower = await followersUsers(user.id)

        res.status(200).send(follower.rows)

    } catch (error) {
        res.status(500).send(error.message);
    }
}