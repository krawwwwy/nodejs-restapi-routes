const express = require('express');
const router = express.Router();
const travelRoutesController = require('../controllers/travelRoutesController');
const { authenticateToken } = require('../middlewares/authMiddleware');

router.get('/routes', authenticateToken, travelRoutesController.getRoutes);
router.post('/routes', authenticateToken, travelRoutesController.createRoute);
router.put('/routes/:id', authenticateToken, travelRoutesController.updateRoute);
router.delete('/routes/:id', authenticateToken, travelRoutesController.deleteRoute);

module.exports = router;

