import joi from "joi"

export const searchSchema = joi.object({
    name: joi.string().min(3).required(),
    token: joi.string()
})