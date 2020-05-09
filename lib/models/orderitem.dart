import 'package:food_app/models/fooditem.dart';

class OrderItem {
  FoodItem fooditem;
  int quantity;

  OrderItem({this.fooditem, this.quantity});
  OrderItem.copy(OrderItem from)
      : this(
          fooditem: from.fooditem,
          quantity: from.quantity,
        );
}

List<OrderItem> orderItems = [];

String returnTotalAmount(List<OrderItem> orderItems) {
  double totalAmount = 0.0;

  for (int i = 0; i < orderItems.length; i++) {
    totalAmount = totalAmount + orderItems[i].fooditem.totalItem;
  }
  return totalAmount.toStringAsFixed(2);
}

String returnTotalFoodQuantity(List<OrderItem> orderItems) {
  int totalAmount = 0;
  for (int i = 0; i < orderItems.length; i++) {
    totalAmount = totalAmount + orderItems[i].quantity;
  }
  return totalAmount.toString();
}

List<OrderItem> addToList(OrderItem orderItem) {
  bool isPresent = false;

  if (orderItems.length > 0) {
    for (int i = 0; i < orderItems.length; i++) {
      if (orderItems[i].fooditem.foodID == orderItem.fooditem.foodID) {
        increaseItemQuantity(orderItems[i], orderItem);
        isPresent = true;
        break;
      } else {
        isPresent = false;
      }
    }

    if (!isPresent) {
      orderItems.add(orderItem);
    }
  } else {
    orderItems.add(orderItem);
  }

  return orderItems;
}

void increaseItemQuantity(OrderItem orderItems, OrderItem orderItem) {
  orderItems.fooditem.quantity += orderItem.fooditem.quantity;
  orderItems.quantity += orderItem.quantity;
}

List<OrderItem> removeFromList(OrderItem orderItem) {
  //remove it from the list
  orderItems.remove(orderItem);

  return orderItems;
}
