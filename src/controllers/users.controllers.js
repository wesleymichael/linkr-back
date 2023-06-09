import { getPostByUserIdDB } from "../repository/posts.repository.js";
import { followUsers, followersUsers, getUsersByIdDB, getUsersFollow, searchUsersByNameDB, unfollowUsers } from "../repository/users.repository.js";

export async function searchUsers(req, res) {

    const { name } = req.body

    try {
        const user = res.locals.user;
        const users = await searchUsersByNameDB(name)
        const noFollowers = []
        const followers = []

        for (let i = 0; i < users.rowCount; i++) {
            delete users.rows[i].password
            delete users.rows[i].email
            const follow = await getUsersFollow(user.id, users.rows[i].id)
            if (follow.rows[0]) {
                followers.push({ ...users.rows[i], follower: true })
            } else {
                noFollowers.push({ ...users.rows[i], follower: false })
            }
        }

        for (let i = 0; i < noFollowers.length; i++) {
            followers.push(noFollowers[i])
        }
        res.send(followers);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function userById(req, res) {

    const { id } = req.params

    try {
        const userLiker = res.locals.user;
        const user = await getUsersByIdDB(id)

        if (user.rowCount === 0) {
            return res.sendStatus(404)
        }

        delete user.rows[0].password
        delete user.rows[0].email

        const posts = await getPostByUserIdDB(id, userLiker.id, req.query)

        if (userLiker.id == id) return res.send({ user: user.rows[0], posts: posts.rows, isMe: true })

        res.send({ user: user.rows[0], posts: posts.rows, isMe: false });
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function follow(req, res) {
    const { followId } = req.body
    try {

        const user = res.locals.user;

        await followUsers(user.id, followId)

        res.sendStatus(200)

    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function unfollow(req, res) {
    const { followId } = req.body
    try {

        const user = res.locals.user;

        await unfollowUsers(user.id, followId)

        res.sendStatus(200)
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function followers(req, res) {
    try {

        const user = res.locals.user;

        const follower = await followersUsers(user.id)

        res.status(200).send(follower.rows)

    } catch (error) {
        res.status(500).send(error.message);
    }
}