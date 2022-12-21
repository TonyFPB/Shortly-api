import pgk from 'pg'
import dotenv from 'dotenv'
dotenv.config()
const { Pool } = pgk

const connection = new Pool({
    host:process.env.HOST,
    port: process.env.PORT_POSTGRES,
    user: process.env.USER_DB,
    password: process.env.PASSWORD,
    database: process.env.DATABASE
})

export default connection