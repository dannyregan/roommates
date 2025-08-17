require("dotenv").config();
const mysql = require("mysql2/promise");

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: 'root',
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
        console.log("Success");
        connection.release();
    } catch (error) {
        console.log(`Failed to connect: ${error}`)
    }
}

connect();