const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class OrderItemModel {
    constructor() {
        if (this.instance) return this.instance;
        OrderItemModel.instance = this;
    }

    get() {
        return database.getList("orderitem");
    }

    getById(id) {
        return database.get("orderitem", id);
    }

    create(orderitem) {
        return database.create("orderitem", orderitem);
    }

    delete(id) {
        return database.delete("orderitem", id);
    }

    update(id, orderitem) {
        return database.set("orderitem", id, orderitem);
    }

}

module.exports = new OrderItemModel();