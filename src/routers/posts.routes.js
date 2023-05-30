import { Router } from "express";
import { authValidation } from "../middlewares/authValidation.middleware.js";
import { createPost, getPosts } from "../controllers/posts.controllers.js";

const postsRouter = Router();

postsRouter.post("/new-post", authValidation, createPost);
postsRouter.get("/posts", authValidation, getPosts);

export default postsRouter;