import { nanoid } from "nanoid"
import connection from "../Database/db.js"

export async function postShortUrl(req, res) {
    const { url } = req.body
    const userId = req.userId

    try {
        const shortUrl = nanoid(6)
        await connection.query(`INSERT INTO urls (url,"shortUrl","userId") VALUES ($1,$2,$3)`, [url, shortUrl, userId])
        res.status(201).send({ shortUrl })
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}

export function getOneUrl(req, res) {
    const urlToSend = res.locals

    res.send(urlToSend)
}