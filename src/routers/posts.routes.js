import { Router } from "express";
import { authValidation } from "../middlewares/authValidation.middleware.js";
import { createPost, deletePost, dislike, getMetadata, getPosts, like } from "../controllers/posts.controllers.js";

const postsRouter = Router();

postsRouter.post("/new-post", authValidation, createPost);
postsRouter.get("/posts", authValidation, getPosts);
postsRouter.post("/like/:postId", authValidation, like);
postsRouter.delete("/dislike/:postId", authValidation, dislike);
postsRouter.get("/metadata", getMetadata);
postsRouter.delete("/delete/:postId", authValidation, deletePost);

export default postsRouter;