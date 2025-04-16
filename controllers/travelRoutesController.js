const travelRouteModel = require('../models/travelRouteModel');

const createRoute = async (req, res) => {
  const userId = req.user.id;
  const { name, description, location, duration, rating } = req.body;
  try {
    const newRoute = await travelRouteModel.addRoute(userId, name, description, location, duration, rating);
    res.status(201).json(newRoute);
  } catch (error) {
    res.status(500).json({ message: 'Server Error' });
  }
};

const updateRoute = async (req, res) => {
  const { id } = req.params;
  const { name, description, location, duration, rating } = req.body;
  try {
    const updatedRoute = await travelRouteModel.updateRoute(id, name, description, location, duration, rating);
    if (!updatedRoute) {
      return res.status(404).json({ message: 'Route not found' });
    }
    res.status(200).json(updatedRoute);
  } catch (error) {
    res.status(500).json({ message: 'Server Error' });
  }
};

const deleteRoute = async (req, res) => {
  const { id } = req.params;
  try {
    await travelRouteModel.deleteRoute(id);
    res.status(200).json({ message: 'Route deleted successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Server Error' });
  }
};

module.exports = {
  createRoute,
  updateRoute,
  deleteRoute,
};

