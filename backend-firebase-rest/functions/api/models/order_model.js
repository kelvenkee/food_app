const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class OrderModel {
    constructor() {
        if (this.instance) return this.instance;
        OrderModel.instance = this;
    }

    get() {
        return database.getList("order");
    }

    getById(id) {
        return database.get("order", id);
    }

    create(order) {
        return database.create("order", order);
    }

    delete(id) {
        return database.delete("order", id);
    }

    update(id, order) {
        return database.set("order", id, order);
    }

}

module.exports = new OrderModel();