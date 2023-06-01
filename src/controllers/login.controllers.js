import { db } from "../database/database.js"
import bcrypt from "bcrypt"
import jwt from "jsonwebtoken"

export async function signup(req, res) {
    const { username, email, password, picture } = req.body
    try {

        const hash = bcrypt.hashSync(password, 10)

        await db.query(`
            INSERT INTO users (username, email, password, image)
            VALUES ($1, $2, $3, $4)
        ;`, [username, email, hash, picture])

        res.sendStatus(201)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function signin(req, res) {
    try {
        const { email } = res.locals.session
        const user = await db.query(`
            SELECT * FROM users
            WHERE email = $1
        ;`, [email])
        delete user.rows[0].password

        const secretKey = process.env.JWT_SECRET
        const token = jwt.sign(user.rows[0], secretKey)

        await db.query(`
            INSERT INTO sessions (token) 
            VALUES ($1)
        ;`, [token])

        res.sendStatus(200)
    } catch (err) {
        res.status(500).send(err.message)
    }
}