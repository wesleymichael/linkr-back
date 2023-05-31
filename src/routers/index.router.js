import { Router } from "express";
import hashtagsRouter from "./hashtag.routes.js";
import postsRouter from "./posts.routes.js";
import usersRouter from "./users.routes.js";

const router = Router();
router.use(postsRouter);
router.use(usersRouter);
router.use(hashtagsRouter);

export default router;
