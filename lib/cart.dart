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
          itemCount: orderItems.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              _showTotal();
            },
            contentPadding: const EdgeInsets.all(5.0),
            leading: Container(
              height: 80.0,
              width: 80.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(orderItems[index].fooditem.imageName,
                    fit: BoxFit.cover, alignment: Alignment.center),
              ),
            ),
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
                      "x" + orderItems[index].quantity.toString(),
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
                'MYR ' + (orderItems[index].fooditem.totalItem.toString()),
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
              label: Text('Confirm Order'),
              icon: Icon(Icons.done),
              backgroundColor: Colors.deepOrangeAccent,
            )
          ],
        ));
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
                Text(returnTotalAmount(orderItems)),
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
// for total price of all food , the code is
//
<<<<<<< HEAD
=======

//to delete item
void deleteFood(OrderItem orderItem) {
  return setState(() {
    removeFromList(orderItem);
  });
>>>>>>> 86a713f93ec402d7455852737dd91d97357bdbf4
}
