import { db } from "../database/database.js"
import bcrypt from "bcrypt"

export async function validateSignUp(req, res, next) {
    const { email } = req.body
    try {

        const emailRepeated = await db.query(`
            SELECT email FROM users
            WHERE email=$1
        `, [email])

        if (emailRepeated.rowCount !== 0) return res.status(409).send("Email já cadastrado")

        next()
    } catch (err) {
        res.status(500).send(err.message)
    }

}

export async function validateSignIn(req, res, next) {
    const { email, password } = req.body
    try {
        const existEmail = await db.query(`
            SELECT email, password FROM users
            WHERE email = $1
        ;`, [email])

        if (existEmail.rowCount === 0) return res.status(404).send("Email não encontrado")

        const passwordUser = bcrypt.compareSync(password, existEmail.rows[0].password)
        if (!passwordUser) return res.status(401).send("Senha incorreta")

        res.locals.session = { email }

        next()
    } catch (err) {
        res.status(500).send(err.message)
    }

}