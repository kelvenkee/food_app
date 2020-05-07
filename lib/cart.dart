import 'package:flutter/material.dart';
import 'models/orderitem.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text('Orders'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                contentPadding: const EdgeInsets.all(5.0),
                title: Text(orderItems[index].fooditem.foodName,
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
                              orderItems[index].quantity.toString() +
                              " Total is :" +
                              returnTotalAmount(orderItems),
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
                    'MYR ' + (orderItems[index].fooditem.totalItem.toString()),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.blueGrey,
              ),
          itemCount: orderItems.length),
    );
  }
}
// for total price of all food , the code is
//
