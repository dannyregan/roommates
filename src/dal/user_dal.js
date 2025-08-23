const pool = require('../db');



async function AddUser(username, passwordHash, name) {
  const [result] = await pool.query(
    `Call good_noodles.AddUser(?, ?, ?)`,
    [username, passwordHash, name]
  );
  return result[0];
}

async function GetUserStats(userId) {
  const [result] = await pool.query(
    `Call good_noodles.GetUserStats(?)`,
    [userId]
  );
  return result[0];
}

async function GetUserFeed(userId) {
  const [result] = await pool.query(
    `Call good_noodles.UserFeed(?)`,
    [userId]
  );
  return result[0];
}

async function UpdateName(userId, name) {
  const [result] = await pool.query(
    `Call good_noodles.UpdateName(?, ?)`,
    [userId, name]
  );
  return result[0];
}

async function CheckUsername(username) {
  const [results] = await pool.query(
    `CALL good_noodles.CheckUserName(?, @taken);
     SELECT @taken AS taken;`,
    [username]
  );

  return results[1][0].taken === 0; 
}

// ============================
// TESTING
// ============================

(async () => {
  try {
    const res = await AddUser("TestUser", "pswd123", 'penny');
    console.log("User created:");
  } catch (err) {
    console.error("Error creating user:", err.message);
  }
})//()
;

(async () => {
  try {
    const res = await GetUserStats(1);
    console.log('User Stats:', res);
  } catch (err) {
    console.error("Error getting user stats:", err.message);
  }
})//()
;

(async () => {
  try {
    const res = await GetUserFeed(1);
    console.log('User Feed:', res);
  } catch (err) {
    console.error("Error getting user feed:", err.message);
  }
})//()
;

(async () => {
  try {
    const res = await UpdateName(1, 'peen');
    console.log('New Name:', res);
  } catch (err) {
    console.error("Error update user name:", err.message);
  }
})//()
;

(async () => {
  try {
    const res = await CheckUsername('asdf');
    console.log("Checked username: ", res);
  } catch (err) {
    console.error("Error checking username:", err.message);
  }
})()
;