const pool = require('../db');

async function CreatePost(userId, taskId, comment) {
  const [result] = await pool.query(
    `Call good_noodles.CreatePost(?, ?, ?)`,
    [userId, taskId, comment]
  );
  return result[0];
}

async function LikePost(postId, userId) {
  const [result] = await pool.query(
    `Call good_noodles.LikePost(?, ?)`,
    [postId, userId]
  );
  return result[0];
}

async function GetPostStats(postId) {
  const [result] = await pool.query(
    `Call good_noodles.GetPostStats(?)`,
    [postId]
  );
  return result[0];
}

async function Feed() {
  const [result] = await pool.query(
    `Call good_noodles.Feed()`
  );
  return result[0];
}

// ============================
// TESTING
// ============================

(async () => {
  try {
    const res = await CreatePost(1, 5, 'Let\'s see');
    console.log("New Post Created:");
  } catch (err) {
    console.error("Error creating post:", err.message);
  }
})//()
;

(async () => {
  try {
    const res = await LikePost(2, 2);
    console.log('Post Liked:', res);
  } catch (err) {
    console.error("Error liking post:", err.message);
  }
})//()
;

(async () => {
  try {
    const res = await GetPostStats(2);
    console.log('Post Stats:', res);
  } catch (err) {
    console.error("Error fetching post stats:", err.message);
  }
})//()
;

(async () => {
  try {
    const res = await Feed();
    console.log('Feed:', res);
  } catch (err) {
    console.error("Error fetching feed:", err.message);
  }
})//()
;