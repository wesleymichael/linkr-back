import { Router } from "express";
import { searchUsers, userById } from "../controllers/users.controllers.js";

const usersRouter = Router()

usersRouter.post("/search", searchUsers)
usersRouter.get("/user/:id", userById)

export default usersRouter