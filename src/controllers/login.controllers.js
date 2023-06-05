import bcrypt from "bcrypt"
import jwt from "jsonwebtoken";
import { insertUserDB } from "../repository/users.repository.js";
import { insertSessionDB } from "../repository/auth.repository.js";

export async function signup(req, res) {
    const { username, email, password, picture } = req.body
    try {

        const hash = bcrypt.hashSync(password, 10)

        await insertUserDB(username, email, hash, picture);

        res.sendStatus(201)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function signin(req, res) {
    try {
        const  user  = res.locals.session;
        const secretKey = "melhorgrupodetodos"
        const token = jwt.sign(user.rows[0], secretKey)

        await insertSessionDB(token);

        const userData = {username: user.rows[0].username, img: user.rows[0].image }

        res.status(201).send({token, userData});
    } catch (err) {
        res.status(500).send(err.message)
    }
}