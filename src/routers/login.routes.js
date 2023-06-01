import { Router } from "express";
import { signin, signup } from "../controllers/login.controllers.js";
import { validateSignIn, validateSignUp } from "../middlewares/validationLogin.middleware.js";
import validationSchemas from "../middlewares/validationSchemas.middleware.js";
import { signupSchema, signinSchema } from "../schemas/login.schemas.js";

const loginRouter = Router()

loginRouter.post("/signup", validationSchemas(signupSchema), validateSignUp, signup)
loginRouter.post("/signin", validationSchemas(signinSchema), validateSignIn, signin)

export default loginRouter