const userModel = require('../models/userModel');

const createUser = async (req, res) => {
  const { username, email, password, preferences } = req.body;
  try {
    const newUser = await userModel.createUser(username, email, password, preferences);
    res.status(201).json(newUser);
  } catch (error) {
    res.status(500).json({ message: 'Server Error' });
  }
};

module.exports = {
  createUser,
};

