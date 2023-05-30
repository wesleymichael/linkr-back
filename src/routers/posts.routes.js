import { Router } from "express";
import { authValidation } from "../middlewares/authValidation.middleware.js";
import { createPost } from "../controllers/posts.controllers.js";

const postsRouter = Router();

postsRouter.post("/new-post", authValidation, createPost);

export default postsRouter;