const pool = require('../db');

async function createUser(username, passwordHash, name) {
  const [result] = await pool.query(
    `Call good_noodles.AddUser(?, ?, ?)`,
    [username, passwordHash, name]
  );
  return result[0];
}

// ============================
// TESTING
// ============================
(async () => {
  try {
    const res = await createUser("TestUser", "pswd123", 'penny');
    console.log("User created:");
  } catch (err) {
    console.error("Error:", err.message);
  }
})();