import jwt from 'jsonwebtoken'
import connection from '../Database/db.js';
import shortUrlSchema from '../Schemas/ShortUrl.schema.js';

export function validateAuthUrls(req, res, next) {
    const { authorization } = req.headers

    if (!authorization) {
        return res.sendStatus(401)
    }
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
        const urlUserExists = await connection.query('SELECT * FROM urls WHERE "userId"=$1 AND url=$2', [userId, url])
        if (urlUserExists.rowCount !== 0) {
            return res.status(409).send({ message: "O usuario ja criou uma shortUrl para essa url." })
        }
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
    next()
}

export async function validateUrlId(req, res, next) {
    const { id } = req.params
    const userId = req.userId
    if (isNaN(id)) {
        return res.sendStatus(404)
    }
    try {
        const urlExist = await connection.query('SELECT id,"shortUrl",url FROM urls WHERE id=$1', [id])
        if (urlExist.rowCount === 0) {
            return res.sendStatus(404)
        }
        res.locals = urlExist.rows[0]
        
        if (userId) {
            const urlUserExists = await connection.query('SELECT * FROM urls WHERE id=$1 AND "userId"=$2', [id, userId])
            if (urlUserExists.rowCount === 0) {
                return res.sendStatus(401)
            }
            res.locals = urlUserExists.rows[0]
        }
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
    next()
}

export async function validateShortUrl(req, res, next) {
    const { shortUrl } = req.params

    try {
        const shortUrlExists = await connection.query('SELECT * FROM urls WHERE "shortUrl"=$1', [shortUrl])
        if (shortUrlExists.rowCount === 0) {
            return res.sendStatus(404)
        }
        res.locals = shortUrlExists.rows[0]
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
    next()
}