import { Router } from "express";
import { searchUsers, userById } from "../controllers/users.controllers.js";
import validationSchemas from "../middlewares/validationSchemas.middleware.js";
import { searchSchema } from "../schemas/search.schema.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";

const usersRouter = Router()

usersRouter.post("/search", validationSchemas(searchSchema), searchUsers)
usersRouter.get("/user/:id", authValidation, userById)

export default usersRouter