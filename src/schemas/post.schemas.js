import Joi from "joi";
import JoiDate from "@joi/date";

const joi = Joi.extend(JoiDate);

export const newPostSchema = joi.object({
    description: joi.string().required(),
    url: joi.string().uri().required()
})

export const editPostSchema = joi.object({
    description: joi.string().required()
})

export const timestampSchema = joi.object({
    lastCreatedAt: joi.date().format('YYYY-MM-DDTHH:mm:ss.SSSSSS').required()
})