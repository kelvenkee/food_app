const functions = require("firebase-functions");
const express = require("express");
const app = express();
const customerRouter = require("./api/controllers/customer_controller");
const diningtableRouter = require("./api/controllers/diningtable_controller");
const fooditemRouter = require("./api/controllers/fooditem_controller");
const orderRouter = require("./api/controllers/order_controller");
const orderitemRouter = require("./api/controllers/orderitem_controller");
const userRouter = require("./api/controllers/user_controller");

app.use(express.json());
app.use("/quotes", customerRouter);
app.use("/customer", diningtableRouter);
app.use("/fooditem", fooditemRouter);
app.use("/order", orderRouter);
app.use("/orderitem", orderitemRouter);
app.use("/user", userRouter);

exports.api = functions.https.onRequest(app);

// To handle "Function Timeout" exception
exports.functionsTimeOut = functions.runWith({
    timeoutSeconds: 300,
});

exports.setupdb = functions.https.onRequest(require('./setup_database'))