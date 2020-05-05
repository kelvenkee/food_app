import 'package:food_app/models/fooditem.dart';

class OrderItem {
  FoodItem fooditem;
  int quantity;
  String orderItemStatus;

  OrderItem({this.fooditem, this.quantity, this.orderItemStatus});
  OrderItem.copy(OrderItem from)
      : this(
            fooditem: from.fooditem,
            quantity: from.quantity,
            orderItemStatus: from.orderItemStatus);
}
