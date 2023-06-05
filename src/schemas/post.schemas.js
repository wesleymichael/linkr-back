import joi from "joi";

export const newPostSchema = joi.object({
    description: joi.string().required(),
    url: joi.string().uri().required()
})

export const editPostSchema = joi.object({
    description: joi.string().required()
})