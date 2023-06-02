import bcrypt from "bcrypt"
import { getUserByEmailDB } from "../repository/users.repository.js"

export async function validateSignUp(req, res, next) {
    const { email } = req.body
    try {

        const emailRepeated = await getUserByEmailDB(email);

        if (emailRepeated.rowCount !== 0) return res.status(409).send("Email já cadastrado")

        next()
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function validateSignIn(req, res, next) {
    const { email, password } = req.body
    try {
        const user = await getUserByEmailDB(email);

        if (user.rowCount === 0) return res.status(404).send("Email não encontrado")

        const passwordUser = bcrypt.compareSync(password, user.rows[0].password)
        if (!passwordUser) return res.status(401).send("Senha incorreta")

        res.locals.session = user;
        next()
    } catch (err) {
        res.status(500).send(err.message)
    }
}