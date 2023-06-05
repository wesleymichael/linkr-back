import jwt from "jsonwebtoken";

export function tokenToUser(token){
    const secretKey = "melhorgrupodetodos";
    const user = jwt.verify(token, secretKey);
    return user;
}