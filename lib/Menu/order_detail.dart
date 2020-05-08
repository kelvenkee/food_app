import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/orderitem.dart';

class OrderDetail extends StatefulWidget {
  final Order _order;
  final int _index;
  OrderDetail(this._order, this._index);
  @override
  _OrderDetail createState() => _OrderDetail();
}

class _OrderDetail extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true,
          title:
              Text("Order Detail for Order " + (widget._index + 1).toString()),
        ),
        body: Column(
          children: <Widget>[
            Divider(
              color: Colors.grey,
              height: 20,
              thickness: 3,
              indent: 0,
              endIndent: 0,
            ),
            Text(
              "Customer: " +
                  widget._order.customer.firstname +
                  " " +
                  widget._order.customer.lastname,
              textAlign: TextAlign.right,
            ),
            Divider(
              color: Colors.grey,
              height: 20,
              thickness: 3,
              indent: 0,
              endIndent: 0,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: widget._order.items.length,
              itemBuilder: (context, index) => ListTile(
                onLongPress: () {
                  deleteFood(widget._order.items[index]);
                },
                contentPadding: const EdgeInsets.all(5.0),
                leading: Container(
                  height: 80.0,
                  width: 80.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                        widget._order.items[index].fooditem.imageName,
                        fit: BoxFit.cover,
                        alignment: Alignment.center),
                  ),
                ),
                title: Text(widget._order.items[index].fooditem.foodName,
                    style: TextStyle(
                        color: Colors.orange[900],
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold)),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "x" +
                              widget._order.items[index].quantity.toString() +
                              "  (RM" +
                              widget._order.items[index].fooditem.unitPrice
                                  .toStringAsFixed(2) +
                              ")",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ]),
                ),
                trailing: Container(
                  width: 55.0,
                  child: Text(
                    // this is the total price for each food , quantity * unit price
                    'MYR ' +
                        ((widget._order.items[index].fooditem.unitPrice *
                                widget._order.items[index].quantity)
                            .toStringAsFixed(2)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.blueGrey,
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 20,
              thickness: 3,
              indent: 0,
              endIndent: 0,
            ),
            Text(
              "Total Quantity: " + widget._order.totalItem.toString(),
              textAlign: TextAlign.right,
            ),
            Text(
              "Total Price: MYR" + widget._order.totalPrice.toStringAsFixed(2),
              textAlign: TextAlign.right,
            ),
            Text(
              "Status: " + widget._order.orderStatus,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: widget._order.orderStatus == "Completed"
                    ? Colors.red[800]
                    : Colors.green[500],
                fontSize: 13.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 20,
              thickness: 3,
              indent: 0,
              endIndent: 0,
            ),
          ],
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  widget._order.orderStatus = "Completed";
                });
                Navigator.of(context).pop(widget._order);
              },
              label: Text('Order Complete'),
              icon: Icon(Icons.done),
              backgroundColor: Colors.deepOrangeAccent,
            )
          ],
        ));
  }

//to delete item
  void deleteFood(OrderItem orderItem) {
    return setState(() {
      removeFromList(orderItem);
    });
  }
}
