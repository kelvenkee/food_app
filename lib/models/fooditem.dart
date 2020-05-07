class FoodItem {
  String foodID;
  String foodName;
  String foodDescription;
  double unitPrice;
  String imageName;

  int quantity;
  FoodItem(
      {this.foodID,
      this.foodName,
      this.foodDescription,
      this.unitPrice,
      this.imageName});
  FoodItem.copy(FoodItem from)
      : this(
            foodID: from.foodID,
            foodName: from.foodName,
            foodDescription: from.foodDescription,
            unitPrice: from.unitPrice,
            imageName: from.imageName);

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}
