const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class DiningTableModel {
    constructor() {
        if (this.instance) return this.instance;
        DiningTableModel.instance = this;
    }

    get() {
        return database.getList("diningtable");
    }

    getById(id) {
        return database.get("diningtable", id);
    }

    create(diningtable) {
        return database.create("diningtable", diningtable);
    }

    delete(id) {
        return database.delete("diningtable", id);
    }

    update(id, diningtable) {
        return database.set("diningtable", id, diningtable);
    }

}

module.exports = new DiningTableModel();