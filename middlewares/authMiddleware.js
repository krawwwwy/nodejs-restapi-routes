const jwt = require('jsonwebtoken');
const userModel = require('../models/userModel');

const authenticateToken = async (req, res, next) => {
  const token = req.headers['authorization'];

  if (!token) {
    return res.status(401).json({ message: 'Authentication token required' });
  }

  try {
    const decoded = jwt.verify(token, 'your_jwt_secret'); // Замените на ваш секретный ключ
    const user = await userModel.getUserById(decoded.id);

    if (!user) {
      return res.status(401).json({ message: 'Invalid token' });
    }

    req.user = user;
    next();
  } catch (err) {
    return res.status(401).json({ message: 'Invalid token' });
  }
};

module.exports = {
  authenticateToken,
};

