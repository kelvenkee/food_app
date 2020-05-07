import 'package:meta/meta.dart';

List<FoodItem> foodItems;

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
}
