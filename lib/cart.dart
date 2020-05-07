import 'package:flutter/material.dart';
import 'models/orderitem.dart';

class Cart extends StatefulWidget {
  final List<OrderItem> _data;

  Cart(this._data);
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: null,
            tooltip: 'Checkout',
          )
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                contentPadding: const EdgeInsets.all(5.0),
                title: Text(widget._data[index].fooditem.foodID),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget._data[index].fooditem.foodID,
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
                    child: Text(widget._data[index].quantity.toString()),
                  ),
                ),
                onTap: () {},
              ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.blueGrey,
              ),
          itemCount: widget._data.length),
    );
  }
}
