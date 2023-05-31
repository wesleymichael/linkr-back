import { Router } from "express";
import { searchUsers } from "../controllers/users.controllers.js";

const usersRouter = Router()

usersRouter.post("/search",searchUsers)

export default usersRouter