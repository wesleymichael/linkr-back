import { Router } from "express";
import postsRouter from "./posts.routes.js";
import usersRouter from "./users.routes.js";

const router = Router();
router.use(postsRouter);
router.use(usersRouter)

export default router;
