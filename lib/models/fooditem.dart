import 'package:meta/meta.dart';

List<FoodItem> foodItems= [];

class FoodItem {
  String foodID;
  String foodName;
  String foodDescription;
  double unitPrice;
  String imageName;
  int quantity;

  FoodItem({
    @required this.foodID,
    @required this.foodName,
    @required this.foodDescription,
    @required this.unitPrice,
    @required this.imageName,
  });

  double get totalItem => (quantity * unitPrice);
  
  FoodItem.copy(FoodItem from)
      : this(
            foodID: from.foodID,
            foodName: from.foodName,
            foodDescription: from.foodDescription,
            unitPrice: from.unitPrice,
            imageName: from.imageName);


  FoodItem.fromJson(Map<String, dynamic> json)
      : this(
            foodID: json['foodID'].toString(),
            foodName: json['foodName'],
            foodDescription: json['foodDescription'],
            unitPrice: json['unitPrice'],
            imageName: json['imageName']
            );

  Map<String, dynamic> toJson() =>
      {'foodID': foodID, 'foodName': foodName, 'foodDescription': foodDescription, 'unitPrice': unitPrice, 'imageName': imageName};
  

}


List<FoodItem> addMenu(FoodItem foodItem) {
  foodItems.add(foodItem);
  return foodItems;
}