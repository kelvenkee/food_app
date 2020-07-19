const diningtableModel = require("../models/diningtable_model");
const express = require("express");
const router = express.Router();

// Get all food item
router.get("/", async (req, res, next) => {
    try {
        const result = await diningtableModel.get();
        return res.json(result);
    } catch (e) {
        return next(e);
    }
});

// Get one food item
router.get("/:id", async (req, res, next) => {
    try {
        const result = await diningtableModel.getById(req.params.id);
        if (!result) return res.sendStatus(404);
        return res.json(result);
    } catch (e) {
        return next(e);
    }
});

// Create a food item
router.post("/", async (req, res, next) => {
    try {
        const result = await diningtableModel.create(req.body);
        if (!result) return res.sendStatus(409);
        return res.status(201).json(result);
    } catch (e) {
        return next(e);
    }
});

// Delete a food item
router.delete("/:id", async (req, res, next) => {
    try {
        const result = await diningtableModel.delete(req.params.id);
        if (!result) return res.sendStatus(404);
        return res.sendStatus(200);
    } catch (e) {
        return next(e);
    }
});

// Update a food item
router.patch("/:id", async (req, res, next) => {
    try {
        const id = req.params.id;
        const data = req.body;

        const doc = await diningtableModel.getById(id);
        if (!doc) return res.sendStatus(404);

        // Merge existing fields with the ones to be updated
        Object.keys(data).forEach((key) => (doc[key] = data[key]));

        const updateResult = await diningtableModel.update(id, doc);
        if (!updateResult) return res.sendStatus(404);

        return res.json(doc);
    } catch (e) {
        return next(e);
    }
});

// Replace a food item
router.put("/:id", async (req, res, next) => {
    try {
        const updateResult = await diningtableModel.update(req.params.id, req.body);
        if (!updateResult) return res.sendStatus(404);

        const result = await diningtableModel.getById(req.params.id);
        return res.json(result);
    } catch (e) {
        return next(e);
    }
});

module.exports = router;