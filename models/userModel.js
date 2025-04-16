const db = require('../config/db');
const bcrypt = require('bcrypt');

const createUser = async (username, email, password, preferences) => {
  const hashedPassword = await bcrypt.hash(password, 10);
  const result = await db.query(
    'INSERT INTO users (username, email, password, preferences) VALUES ($1, $2, $3, $4) RETURNING *',
    [username, email, hashedPassword, preferences]
  );
  return result.rows[0];
};

const getUserById = async (id) => {
  const result = await db.query('SELECT * FROM users WHERE id = $1', [id]);
  return result.rows[0];
};

const getUserByEmail = async (email) => {
  const result = await db.query('SELECT * FROM users WHERE email = $1', [email]);
  return result.rows[0];
};

module.exports = {
  createUser,
  getUserById,
  getUserByEmail,
};

