const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class UserModel {
    constructor() {
        if (this.instance) return this.instance;
        UserModel.instance = this;
    }

    get() {
        return database.getList("user");
    }

    getById(id) {
        return database.get("user", id);
    }

}

module.exports = new UserModel();