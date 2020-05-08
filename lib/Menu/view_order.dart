import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'order_detail.dart';

class ViewOrder extends StatefulWidget {
  final List _order;
  ViewOrder(this._order);
  @override
  _ViewOrderState createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text("View Order"),
      ),
      body: ListView.separated(
        itemCount: widget._order.length,
        itemBuilder: (context, index) => ListTile(
          contentPadding: const EdgeInsets.all(5.0),
          title: Text("Order #" + (index + 1).toString(),
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
                    widget._order[index].orderStatus,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "Order By " +
                        widget._order[index].customer.firstname +
                        " " +
                        widget._order[index].customer.lastname,
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
            child: Icon(Icons.check_circle_outline,
                color: this.widget._order[index].orderStatus == "Completed"
                    ? Colors.red
                    : Colors.green),
          ),
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderDetail(widget._order[index],index)),
            )
          },
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
