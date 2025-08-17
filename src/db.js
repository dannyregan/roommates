require("dotenv").config();
const mysql = require("mysql2/promise");

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER || 'root',
  port: process.env.DB_PORT,
  // password: "password",
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

module.exports = pool;

async function connect() {
    try {
        const connection = await pool.getConnection();
        console.log("Connection sccessful");
        connection.release();
    } catch (error) {
        console.log(`Failed to connect: ${error}`)
    }
}