const express = require('express');
const router = express.Router();
const travelRoutesController = require('../controllers/travelRoutesController');
const { authenticateToken } = require('../middlewares/authMiddleware');
const travelRouteModel = require('../models/travelRouteModel');

router.get('/routes', authenticateToken, travelRoutesController.getRoutes);
router.post('/routes', authenticateToken, travelRoutesController.createRoute);
router.put('/routes/:id', authenticateToken, travelRoutesController.updateRoute);
router.delete('/routes/:id', authenticateToken, travelRoutesController.deleteRoute);

// Новый маршрут для рекомендованных маршрутов
router.get('/routes/recommended', authenticateToken, async (req, res) => {
    try {
        const userId = req.user.id;
        const allRoutes = await travelRouteModel.getAllRoutes();
        const recommendedRoutes = allRoutes.filter(route => route.user_id !== userId);

        // Получаем 5 случайных маршрутов
        const shuffled = recommendedRoutes.sort(() => 0.5 - Math.random());
        const randomRoutes = shuffled.slice(0, 5);

        res.status(200).json(randomRoutes);
    } catch (error) {
        res.status(500).json({ message: 'Server Error' });
    }
});

module.exports = router;

