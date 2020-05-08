import 'package:food_app/models/customer.dart';
import 'order.dart';

class DiningTable{
  Order order;
  Customer customer;
  String tableStatus; //either Empty, Occupied, Cleaning
  String tableImageName;

DiningTable({this.order, this.customer, this.tableStatus,this.tableImageName});
  DiningTable.copy(DiningTable from)
      : this(
            order: from.order,
            customer: from.customer,
            tableStatus: from.tableStatus,
            tableImageName:from.tableImageName);

}