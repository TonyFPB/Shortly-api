import connection from '../Database/db.js'
import jwt from 'jsonwebtoken'

export async function postSignUp(req, res) {
    const { name, email, password } = res.locals
    try {
        await connection.query(`INSERT INTO users (name,email,password) VALUES ($1,$2,$3)`, [name, email, password])
        res.sendStatus(201)
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}

export function postSignIn(req, res) {
    const { id } = res.locals
    
    const token = jwt.sign({ id: id }, process.env.SECRET_JWT, { expiresIn: 86400 })
    res.send({ token })
}