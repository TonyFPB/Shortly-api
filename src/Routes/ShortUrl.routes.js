import { Router } from "express";
import { deleteShortUrl, getOneUrl, getOpenShortUrl, getUrlsUser, postShortUrl } from "../Controllers/ShortUrls.controllers.js";
import { conflictUrlUser, validateAuthUrls, validateShortUrl, validateUrl, validateUrlId } from "../Middlewares/ShortUrls.middlewares.js";

const shortUrlsRoutes = Router()

shortUrlsRoutes.post('/urls/shorten', validateAuthUrls, validateUrl, conflictUrlUser, postShortUrl)

shortUrlsRoutes.get('/urls/:id', validateUrlId, getOneUrl)
shortUrlsRoutes.get('/urls/open/:shortUrl', validateShortUrl, getOpenShortUrl)
shortUrlsRoutes.get('/users/me', validateAuthUrls, getUrlsUser)

shortUrlsRoutes.delete('/urls/:id', validateAuthUrls, validateUrlId, deleteShortUrl)

shortUrlsRoutes.get('/ranking')

export default shortUrlsRoutes