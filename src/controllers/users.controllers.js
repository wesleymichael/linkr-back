import { searchUsersByName } from "../repository/users.repository.js";

export async function searchUsers(req,res){

    const { name } = req.body

    try {
        const users = await searchUsersByName(name)
        res.send(users.rows);        
    } catch (error) {
        res.status(500).send(error.message);
    }
}