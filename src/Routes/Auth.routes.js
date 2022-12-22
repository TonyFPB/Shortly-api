import Router from 'express'
import { postSignIn, postSignUp } from '../Controllers/Auth.controllers.js'
import { authenticationSignIn, conflictSignUp, validateSignIn, validateSignUp } from '../Middlewares/Auth.middlewares.js'

const authRoutes = Router()

authRoutes.post('/signup', validateSignUp, conflictSignUp, postSignUp)
authRoutes.post('/signin', validateSignIn,authenticationSignIn, postSignIn)

export default authRoutes