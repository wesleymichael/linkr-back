import { Router } from "express";
import { getHashtagPosts, getTrendingTags } from "../controllers/hashtags.controllers.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";

const hashtagsRouter = Router()

hashtagsRouter.get("/trendingtags", getTrendingTags)
hashtagsRouter.get("/hashtag/:hashtag", authValidation, getHashtagPosts)

export default hashtagsRouter