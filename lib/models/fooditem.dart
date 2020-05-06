class FoodItem {
  String foodName;
  String foodDescription;
  double unitPrice;

  String imageName;

  FoodItem(
      {this.foodName, this.foodDescription, this.unitPrice, this.imageName});
  FoodItem.copy(FoodItem from)
      : this(
            foodName: from.foodName,
            foodDescription: from.foodDescription,
            unitPrice: from.unitPrice,
            imageName: from.imageName);
}
