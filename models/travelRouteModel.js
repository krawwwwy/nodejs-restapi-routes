const db = require('../config/db');

const getAllRoutes = async () => {
  const result = await db.query('SELECT * FROM travel_routes ORDER BY id');
  return result.rows;
};

const addRoute = async (userId, name, description, location, duration, rating) => {
  const result = await db.query(
    'INSERT INTO travel_routes (user_id, name, description, location, duration, rating) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
    [userId, name, description, location, duration, rating]
  );
  return result.rows[0];
};

const updateRoute = async (id, name, description, location, duration, rating) => {
  const result = await db.query(
    'UPDATE travel_routes SET name = $1, description = $2, location = $3, duration = $4, rating = $5 WHERE id = $6 RETURNING *',
    [name, description, location, duration, rating, id]
  );
  return result.rows[0];
};

const deleteRoute = async (id) => {
  await db.query('DELETE FROM travel_routes WHERE id = $1', [id]);
};

module.exports = {
  getAllRoutes,
  addRoute,
  updateRoute,
  deleteRoute,
};

