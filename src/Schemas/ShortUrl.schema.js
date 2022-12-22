import Joi from 'joi'

const shortUrlSchema = Joi.object({
    url:Joi.string().uri().required()
})

export default shortUrlSchema