import 'package:food_app/models/customer.dart';
import 'order.dart';

class Table{
  Order order;
  Customer customer;
  String tableStatus; //either Empty, Occupied, Cleaning
  String tableImageName;

Table({this.order, this.customer, this.tableStatus,this.tableImageName});
  Table.copy(Table from)
      : this(
            order: from.order,
            customer: from.customer,
            tableStatus: from.tableStatus,
            tableImageName:from.tableImageName);

}