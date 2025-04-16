const { Client } = require('pg');
require('dotenv').config();

const client = new Client({
  user: 'krawy',          // Добавлены кавычки
  host: 'localhost',      // Добавлены кавычки
  database: 'travel_routes_db',       // Добавлены кавычки
  password: '1234',       // Добавлены кавычки
  port: 5432,             // Число не требует кавычек
});

client.connect()
  .then(() => console.log('Connected to PostgreSQL database'))
  .catch(err => console.error('Connection error', err.stack));

module.exports = client;
