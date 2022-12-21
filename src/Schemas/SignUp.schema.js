import Joi from 'joi'

const SignUpSchema = Joi.object({
    name:Joi.string().min(3).trim().required(),
    email:Joi.string().email().trim().required(),
    password:Joi.string().alphanum().trim().min(6).required(),
    confirmPassword:Joi.string().alphanum().trim().min(6).required(),
})

export default SignUpSchema