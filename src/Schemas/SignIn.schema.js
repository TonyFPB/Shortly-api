import Joi from "joi"

const signInSchema = Joi.object({
    email:Joi.string().email().required(),
    password:Joi.string().min(6).alphanum().required()
})

export default signInSchema