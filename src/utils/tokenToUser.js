import jwt from "jsonwebtoken";

export function tokenToUser(token){
    const secretKey = process.env.SECRET_KEY;
    const user = jwt.verify(token, secretKey);
    return user;
}