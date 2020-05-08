import 'package:food_app/models/orderitem.dart';
import 'package:food_app/models/customer.dart';

class Order {
  List<OrderItem> items;
  String type; // either Dine In, Take Away, or Delivery
  String orderStatus; // either In Process or Completed
  Customer customer;
  int orderID;

  Order({this.items, this.type, this.customer, this.orderStatus,this.orderID});
  Order.copy(Order from)
      : this(
            items: from.items.map((items) => OrderItem.copy(items)).toList(),
            type: from.type,
            customer: from.customer,
            orderStatus: from.orderStatus,
            orderID:from.orderID);

  int get totalItem => (items.fold(0, (sum, item) => sum + item.quantity));
  double get totalPrice => (items.fold(
      0, (sum, item) => sum + (item.quantity * item.fooditem.unitPrice)));
}
