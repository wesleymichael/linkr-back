import { Router } from "express";
import { repost, unrepost } from "../controllers/repost.controllers.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";

const repostRouter = Router()

repostRouter.post("/repost/:postId", authValidation, repost)
repostRouter.delete("/repost/:postId", authValidation, unrepost)

export default repostRouter