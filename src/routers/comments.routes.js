import { Router } from "express";
import { authValidation } from "../middlewares/authValidation.middleware.js";
import { addComment, getCommentsByPostId } from "../controllers/comments.controllers.js";

const commentsRouter = Router()

commentsRouter.post("/comments/:postId", authValidation, addComment)
commentsRouter.get("/comments/:postId", authValidation, getCommentsByPostId)

export default commentsRouter