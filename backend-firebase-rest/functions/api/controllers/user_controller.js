const foodModel = require("../models/user_model");
const express = require("express");
const router = express.Router();

// Get all food item
router.get("/", async (req, res, next) => {
    try {
        const result = await foodModel.get();
        return res.json(result);
    } catch (e) {
        return next(e);
    }
});

// Get one food item
router.get("/:id", async (req, res, next) => {
    try {
        const result = await foodModel.getById(req.params.id);
        if (!result) return res.sendStatus(404);
        return res.json(result);
    } catch (e) {
        return next(e);
    }
});

module.exports = router;