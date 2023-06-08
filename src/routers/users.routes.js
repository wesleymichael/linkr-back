import { Router } from "express";
import { follow, followers, searchUsers, unfollow, userById } from "../controllers/users.controllers.js";
import validationSchemas from "../middlewares/validationSchemas.middleware.js";
import { searchSchema } from "../schemas/search.schema.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";

const usersRouter = Router()

usersRouter.post("/search", validationSchemas(searchSchema), searchUsers)
usersRouter.get("/user/:id", authValidation, userById)
usersRouter.post("/follow", authValidation, follow)
usersRouter.post("/unfollow", authValidation, unfollow)
usersRouter.get("/followers", authValidation, followers)

export default usersRouter