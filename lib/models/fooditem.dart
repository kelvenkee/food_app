import 'package:meta/meta.dart';

List<FoodItem> foodItems = [];

class FoodItem {
  String id;
  String foodName;
  String foodDescription;
  double unitPrice;
  String imageName;
  int quantity;

  FoodItem({    
    @required this.foodName,
    @required this.foodDescription,
    @required this.unitPrice,
    @required this.imageName,
    @required this.id,
  });

  double get totalItem => (quantity * unitPrice);

  FoodItem.copy(FoodItem from)
      : this(
            foodName: from.foodName,
            foodDescription: from.foodDescription,
            unitPrice: from.unitPrice,
            imageName: from.imageName,
            id: from.id,);

  FoodItem.fromJson(Map<String, dynamic> json)
      : this(
          foodName: json['foodName'],
          foodDescription: json['foodDescription'],
          unitPrice: json['unitPrice'].toDouble(),
          imageName: json['imageName'],
          id: json['id'].toString(),
        );

  Map<String, dynamic> toJson() => {
        'foodName': foodName,
        'foodDescription': foodDescription,
        'unitPrice': unitPrice,
        'imageName': imageName,
        'id': id,
      };
}

List<FoodItem> addMenu(FoodItem foodItem) {
  foodItems.add(foodItem);
  return foodItems;
}
