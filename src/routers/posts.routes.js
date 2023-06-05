import { Router } from "express";
import { authValidation } from "../middlewares/authValidation.middleware.js";
import { createPost, deletePost, dislike, editPost, getMetadata, getPosts, like } from "../controllers/posts.controllers.js";
import validationSchemas from "../middlewares/validationSchemas.middleware.js";
import { editPostSchema, newPostSchema } from "../schemas/post.schemas.js";

const postsRouter = Router();

postsRouter.post("/new-post", authValidation, validationSchemas(newPostSchema), createPost);
postsRouter.get("/posts", authValidation, getPosts);
postsRouter.post("/like/:postId", authValidation, like);
postsRouter.delete("/dislike/:postId", authValidation, dislike);
postsRouter.get("/metadata", getMetadata);
postsRouter.delete("/delete/:postId", authValidation, deletePost);
postsRouter.patch("/update/:postId", authValidation,validationSchemas(editPostSchema), editPost);

export default postsRouter;