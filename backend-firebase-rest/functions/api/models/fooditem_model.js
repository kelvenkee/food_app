const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class FoodItemModel {
    constructor() {
        if (this.instance) return this.instance;
        FoodItemModel.instance = this;
    }

    get() {
        return database.getList("fooditem");
    }

    getById(id) {
        return database.get("fooditem", id);
    }

    create(fooditem) {
        return database.create("fooditem", fooditem);
    }

    delete(id) {
        return database.delete("fooditem", id);
    }

    update(id, fooditem) {
        return database.set("fooditem", id, fooditem);
    }

}

module.exports = new FoodItemModel();