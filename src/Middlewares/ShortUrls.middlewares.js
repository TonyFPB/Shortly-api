import jwt from 'jsonwebtoken'
import connection from '../Database/db.js';
import shortUrlSchema from '../Schemas/ShortUrl.schema.js';

export function validateAuthUrls(req, res, next) {
    const { authorization } = req.headers

    const [schema, token] = authorization.split(' ')
    if (schema !== 'Bearer' || !token) {
        return res.sendStatus(401)
    }

    let errorJWT;
    let decodedJWT;
    jwt.verify(token, process.env.SECRET_JWT, (error, decoded) => {
        errorJWT = error
        decodedJWT = decoded
    })

    if (errorJWT) {
        return res.sendStatus(401)
    }

    req.userId = decodedJWT.id

    next()
}

export function validateUrl(req, res, next) {
    const url = req.body

    const validation = shortUrlSchema.validate(url, { abortEarly: false })
    if (validation.error) {
        const errors = validation.error.details.map(d => d.message)
        return res.status(422).send({ message: errors })
    }
    next()
}

export async function conflictUrlUser(req, res, next) {
    const { url } = req.body
    const userId = req.userId
    try {
        const urlUserExists = await connection.query('SELECT * FROM urls WHERE "userId"=$1 AND url=$2',[userId,url])
        if(urlUserExists.rowCount !== 0 ){
            return res.status(409).send({message:"O usuario ja criou uma shortUrl para essa url."})
        }
    } catch (err){
        console.log(err)
        res.sendStatus(500)
    }
    next()
}