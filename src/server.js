import express from "express"
import cors from "cors"
import dotenv from 'dotenv'
import authRoutes from "./Routes/Auth.routes.js"
import shortUrlsRoutes from "./Routes/ShortUrl.routes.js"

dotenv.config()

const app = express()
app.use(cors())
app.use(express.json())
app.use(authRoutes)
app.use(shortUrlsRoutes)

const port = process.env.PORT
app.listen(port, console.log(`Server is running in port ${port}`))