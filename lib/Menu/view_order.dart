import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/order.dart';
import 'order_detail.dart';

class ViewOrder extends StatefulWidget {
  final List _order;
  ViewOrder(this._order);
  @override
  _ViewOrderState createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
void _navigate(_order,_index) async {
    final Order returnData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetail(Order.copy(_order))
      ),
    );

    if (returnData != null) {
      setState(() => widget._order[_index] = returnData);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text("View Order"),
      ),
      body: ListView.separated(
        itemCount: widget._order.length,
        itemBuilder: (context, index) => new Container(
          decoration: new BoxDecoration (
                color: this.widget._order[index].orderStatus=="Completed"? Colors.red[200]:Colors.green[200],
            ),
          
          child: ListTile(
          contentPadding: const EdgeInsets.all(5.0),
          
          title: Text("Order #" + (index + 1).toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold)),
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Column(
            
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget._order[index].type,
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
          trailing: Column(children: <Widget>[
            Icon(orderStatusIcon(this.widget._order[index].orderStatus),
                            color: this.widget._order[index].orderStatus == "Completed"
                                ? Colors.red[800]
                                : Colors.green[800]),
                        Text(
                          widget._order[index].orderStatus,
                          style: TextStyle(
                            color: widget._order[index].orderStatus == "Completed"
                                ? Colors.red[800]
                                : Colors.green[800],
                            fontSize: 13.0,
                          ),
                        )
                      ]),
                      onTap: () => {
                        _navigate(widget._order[index], index)
                      },
                    ),
                    ),
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.blueGrey,
                    ),
                  ),
                );
              }
            
              IconData orderStatusIcon(String status) {
                if (status=="Completed") {
                  return Icons.check_circle_outline;
                } else {
                  return Icons.schedule;
                }
              }
}
