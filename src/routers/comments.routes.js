import { Router } from "express";
import { authValidation } from "../middlewares/authValidation.middleware.js";
import { addComment, getCommentsByUserId } from "../controllers/comments.controllers.js";

const commentsRouter = Router()

commentsRouter.post("/comments/:postId", authValidation, addComment)
commentsRouter.get("/comments/:postId", authValidation, getCommentsByUserId)

export default commentsRouter