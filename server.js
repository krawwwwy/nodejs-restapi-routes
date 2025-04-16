const express = require('express');
const path = require('path');
const app = express();

// Подключение маршрутов
const travelRoutes = require('./routes/travelRoutes');
const userRoutes = require('./routes/userRoutes');
const authRoutes = require('./routes/authRoutes');

// Middleware для обработки JSON
app.use(express.json());

// Раздача статических файлов из папки public
app.use(express.static(path.join(__dirname, 'public')));

// Подключение маршрутов API
app.use('/api', travelRoutes);
app.use('/api', userRoutes);
app.use('/api', authRoutes);

// Обработка корневого пути
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Обработка ошибки 404
app.use((req, res) => {
  res.status(404).json({ message: 'Route not found' });
});

// Обработка ошибок сервера
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Internal server error' });
});

// Запуск сервера
const port = process.env.SERVER_PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

