const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class CustomerModel {
    constructor() {
        if (this.instance) return this.instance;
        CustomerModel.instance = this;
    }

    get() {
        return database.getList("customer");
    }

    getById(id) {
        return database.get("customer", id);
    }

    create(customer) {
        return database.create("customer", customer);
    }

    delete(id) {
        return database.delete("customer", id);
    }

    update(id, customer) {
        return database.set("customer", id, customer);
    }

}

module.exports = new CustomerModel();