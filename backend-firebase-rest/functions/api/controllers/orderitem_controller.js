const orderitemModel = require("../models/orderitem_model");
const express = require("express");
const router = express.Router();

// Get all order item
router.get("/", async (req, res, next) => {
    try {
        const result = await orderitemModel.get();
        return res.json(result);
    } catch (e) {
        return next(e);
    }
});

// Get one order item
router.get("/:id", async (req, res, next) => {
    try {
        const result = await orderitemModel.getById(req.params.id);
        if (!result) return res.sendStatus(404);
        return res.json(result);
    } catch (e) {
        return next(e);
    }
});

// Create an order item
router.post("/", async (req, res, next) => {
    try {
        const result = await orderitemModel.create(req.body);
        if (!result) return res.sendStatus(409);
        return res.status(201).json(result);
    } catch (e) {
        return next(e);
    }
});

// Delete an order item
router.delete("/:id", async (req, res, next) => {
    try {
        const result = await orderitemModel.delete(req.params.id);
        if (!result) return res.sendStatus(404);
        return res.sendStatus(200);
    } catch (e) {
        return next(e);
    }
});

// Update an order item
router.patch("/:id", async (req, res, next) => {
    try {
        const id = req.params.id;
        const data = req.body;

        const doc = await orderitemModel.getById(id);
        if (!doc) return res.sendStatus(404);

        // Merge existing fields with the ones to be updated
        Object.keys(data).forEach((key) => (doc[key] = data[key]));

        const updateResult = await orderitemModel.update(id, doc);
        if (!updateResult) return res.sendStatus(404);

        return res.json(doc);
    } catch (e) {
        return next(e);
    }
});

// Replace an order item
router.put("/:id", async (req, res, next) => {
    try {
        const updateResult = await orderitemModel.update(req.params.id, req.body);
        if (!updateResult) return res.sendStatus(404);

        const result = await orderitemModel.getById(req.params.id);
        return res.json(result);
    } catch (e) {
        return next(e);
    }
});

module.exports = router;