import { Router } from "express";
import { getHashtagPosts, getTrendingTags } from "../controllers/hashtags.controllers.js";

const hashtagsRouter = Router()

hashtagsRouter.get("/trendingtags", getTrendingTags)
hashtagsRouter.get("/hashtag/:hashtagId", getHashtagPosts)

export default hashtagsRouter