import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:badges/badges.dart';
import 'package:food_app/models/orderitem.dart';

class CustomerPage extends StatefulWidget {
  final List _foodItems;

  CustomerPage(this._foodItems);
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text('Menu'),
        actions: <Widget>[
          Badge(
            position: BadgePosition.topRight(top: 0, right: 3),
            badgeContent: Text(orderItems.length.toString()),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, cartRoute);
              },
              tooltip: 'Checkout',
            ),
          ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                contentPadding: const EdgeInsets.all(5.0),
                title: Text(widget._foodItems[index].foodName,
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
                          "Price: RM" +
                              widget._foodItems[index].unitPrice
                                  .toStringAsFixed(2),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          widget._foodItems[index].foodDescription,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ]),
                ),
                trailing: Container(
                  height: 80.0,
                  width: 80.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(widget._foodItems[index].imageName,
                        fit: BoxFit.cover, alignment: Alignment.center),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    food_detailRoute,
                    arguments: widget._foodItems[index],
                  );
                },
              ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.blueGrey,
              ),
          itemCount: widget._foodItems.length),
    );
  }
}
