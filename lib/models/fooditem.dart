class FoodItem {
  String foodName;
  String foodDescription;
  double unitPrice;
  int estimatedTime; //in minutes

  FoodItem({this.foodName,this.foodDescription, this.unitPrice, this.estimatedTime});
  FoodItem.copy(FoodItem from)
      : this(
            foodName: from.foodName,
            foodDescription:from.foodDescription,
            unitPrice: from.unitPrice,
            estimatedTime: from.estimatedTime);
}
