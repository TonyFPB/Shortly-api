import express from "express"
import cors from "cors"
import dotenv from 'dotenv'
import connection from "./Database/db.js"
import authRoutes from "./Routes/Auth.routes.js"

dotenv.config()

const app = express()
app.use(cors())
app.use(express.json())
app.use(authRoutes)

const port = process.env.PORT || 4000
app.listen(port, console.log(`Server is running in port ${port}`))