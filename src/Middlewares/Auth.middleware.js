import connection from "../Database/db.js"
import SignUpSchema from "../Schemas/SignUp.schema.js"
import bcrypt from 'bcrypt'
import signInSchema from "../Schemas/SignIn.schema.js"

export function validateSignUp(req, res, next) {
    const user = req.body

    const validation = SignUpSchema.validate(user, { abortEarly: false })
    if (validation.error) {
        const errors = validation.error.details.map(d => d.message)
        return res.status(422).send({ message: errors })
    }

    if (user.password !== user.confirmPassword) {
        return res.status(422).send({ message: "Os campos PASSWORD e CONFIRMPASSWOR nao sao iguais" })
    }
    res.locals = validation.value
    const passwordHash = bcrypt.hashSync(res.locals.password, 10)
    res.locals.password = passwordHash
    console.log(res.locals)
    next()
}

export async function conflictSignUp(req, res, next) {
    const { email } = res.locals
    try {
        const userExists = await connection.query(`SELECT * FROM users WHERE email=$1`, [email])
        if (userExists.rowCount !== 0) {
            return res.sendStatus(409)
        }
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
    next()
}

export function validateSignIn(req, res, next) {
    const user = req.body

    const validation = signInSchema.validate(user, { abortEarly: false })
    if (validation.error) {
        const errors = validation.error.details.map(d => d.message)
        return res.status(422).send({ message: errors })
    }
    next()
}

export async function authenticationSignIn(req, res, next) {
    const { email, password } = req.body

    try {
        const userExists = await connection.query(`SELECT * FROM users WHERE email=$1`, [email])
        if (userExists.rowCount === 0 || !bcrypt.compareSync(password, userExists.rows[0].password)) {
            return res.sendStatus(401)
        }
        res.locals = userExists.rows[0]
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
    next()
}