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
        title: Text("Order Detail for Order " + (widget._index + 1).toString()),
      ),
      body: ListView.separated(
        itemCount: widget._order.items.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            _showTotal();
          },
          onLongPress: () {
            deleteFood(widget._order.items[index]);
          },
          contentPadding: const EdgeInsets.all(5.0),
          leading: Container(
            height: 80.0,
            width: 80.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(widget._order.items[index].fooditem.imageName,
                  fit: BoxFit.cover, alignment: Alignment.center),
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
                    "x" + widget._order.items[index].quantity.toString(),
                    // " Total is :" +
                    // returnTotalAmount(orderItems),
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
              'MYR ' + ((widget._order.items[index].fooditem.unitPrice*widget._order.items[index].quantity).toString()),
            ),
          ),
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
      ),
      floatingActionButton: Stack(
          children: <Widget>[
            FloatingActionButton.extended(              
              onPressed: null,
              label: Text('Order Done'),
              icon: Icon(Icons.done),
              backgroundColor: Colors.green[400],
            )
          ],
        )
    );
  }

  Future<void> _showTotal() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Total Price'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(returnTotalAmount(widget._order.items)),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

//to delete item
  void deleteFood(OrderItem orderItem) {
    return setState(() {
      removeFromList(orderItem);
    });
  }
}
