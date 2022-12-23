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

export async function getOpenShortUrl(req, res) {
    res.locals.visitCount += 1
    const { id, url, visitCount } = res.locals

    try {
        await connection.query('UPDATE urls SET "visitCount"=$1 WHERE id=$2', [visitCount, id])
        res.redirect(url)
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}

export async function getUrlsUser(req, res) {
    const userId = req.userId
    try {
        const userUrls = connection.query(`
            SELECT us.id, us.name, SUM(ur."visitCount") AS "visitCount",ARRAY_AGG (JSON_BUILD_OBJECT('id',ur.id,'shortUrl',ur."shortUrl",'url',ur.url,'visitCount',ur."visitCount") ORDER BY ur.id) AS "shortenedUrls"  
            FROM urls ur 
            JOIN users us ON ur."userId"=us.id 
            WHERE "userId"=$1 GROUP BY us.id;
        `, [userId])
        res.send((await userUrls).rows)
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}

export async function deleteShortUrl(req, res) {
    const { id } = res.locals
    try {
        await connection.query('DELETE FROM urls WHERE id=$1', [id])
        res.sendStatus(204)
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}

export async function getRankingUrls(req, res) {
    try {
        const ranking = await connection.query(`
            SELECT us.id,us.name,COUNT(CASE WHEN ur."userId" is null THEN null ELSE 1 END) AS "linksCount", CASE WHEN ur."userId" is null THEN 0 ELSE SUM(ur."visitCount") END AS "visitCount"
            FROM  urls ur
            RIGHT JOIN users us ON ur."userId"=us.id
            GROUP BY ur."userId", us.id ORDER BY "visitCount" DESC ,"linksCount" DESC  LIMIT 10 ;
        `)
        res.send(ranking.rows)
    } catch (err) {
        console.log(err)
        res.sendStatus(500)
    }
}