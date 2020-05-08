import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/diningtable.dart';
import '../models/orderitem.dart';

class TableOrderDetail extends StatefulWidget {
  final DiningTable _table;
  final int _index;
  TableOrderDetail(this._table, this._index);
  @override
  _TableOrderDetailState createState() => _TableOrderDetailState();
}

class _TableOrderDetailState extends State<TableOrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: appBarTitle(),
      ),
      body: buildTableListview(),
      floatingActionButton: actionbutton(),
    );
  }

  //to delete item
  void deleteFood(OrderItem orderItem) {
    return setState(() {
      removeFromList(orderItem);
    });
  }

  Widget buildTableListview() {
    if (widget._table.order != null) {
      return Column(
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
                widget._table.order.customer.firstname +
                " " +
                widget._table.order.customer.lastname,
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
            itemCount: widget._table.order.items.length,
            itemBuilder: (context, index) => ListTile(
              onLongPress: () {
                deleteFood(widget._table.order.items[index]);
              },
              contentPadding: const EdgeInsets.all(5.0),
              leading: Container(
                height: 80.0,
                width: 80.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                      widget._table.order.items[index].fooditem.imageName,
                      fit: BoxFit.cover,
                      alignment: Alignment.center),
                ),
              ),
              title: Text(widget._table.order.items[index].fooditem.foodName,
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
                            widget._table.order.items[index].quantity
                                .toString() +
                            "  (RM" +
                            widget._table.order.items[index].fooditem.unitPrice
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
                      ((widget._table.order.items[index].fooditem.unitPrice *
                              widget._table.order.items[index].quantity)
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
            "Total Quantity: " + widget._table.order.totalItem.toString(),
            textAlign: TextAlign.right,
          ),
          Text(
            "Total Price: MYR" +
                widget._table.order.totalPrice.toStringAsFixed(2),
            textAlign: TextAlign.right,
          ),
          Text(
            "Status: " + widget._table.order.orderStatus,
            textAlign: TextAlign.right,
            style: TextStyle(
                color: widget._table.order.orderStatus == "Completed"
                    ? Colors.red[800]
                    : Colors.green[500],
                fontSize: 13.0,
                fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.grey,
            height: 20,
            thickness: 3,
            indent: 0,
            endIndent: 0,
          ),
        ],
      );
    } else if (widget._table.tableStatus == "Empty") {
      return Column(children: <Widget>[
        Image.asset("assets/plate.gif"),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(28.0),
            side: BorderSide(color: Colors.black),
          ),
          padding: const EdgeInsets.all(16.0),
          color: Colors.green[100],
          child: Text(
            "The Table is Empty",
            style: TextStyle(color: Colors.white, fontSize: 24, shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black,
                offset: Offset(3.0, 3.0),
              ),
            ]),
          ),
          onPressed: () {},
        ),
      ]);
    } else {
      return Column(
        children: <Widget>[
          Image.asset("assets/cleaning.gif"),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(28.0),
              side: BorderSide(color: Colors.black),
            ),
            padding: const EdgeInsets.all(16.0),
            color: Colors.yellow[200],
            child: Text(
              "Cleaning in Progress",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(3.0, 3.0),
                  ),
                ],
              ),
            ),
            onPressed: () {},
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(28.0),
              side: BorderSide(color: Colors.black),
            ),
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Text(
              "Done Cleanig?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            onPressed: () {
              setState(() {
                widget._table.tableStatus = "Empty";
                widget._table.tableImageName = "assets/table_green.png";
              });
              Navigator.of(context).pop(widget._table);
            },
          )
        ],
      );
    }
  }

  actionbutton() {
    if (widget._table.tableStatus == "Occupied") {
      return Stack(
        children: <Widget>[
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                widget._table.tableStatus = "Cleaning";
                widget._table.tableImageName = "assets/table_yellow.png";

                widget._table.order.orderStatus = "Completed";
                widget._table.order = null;
              });
              Navigator.of(context).pop(widget._table);
            },
            label: Text('Cleaning Table'),
            icon: Icon(Icons.done),
            backgroundColor: Colors.deepOrangeAccent,
          )
        ],
      );
    } else {
      return null;
    }
  }

  appBarTitle() {
    if (widget._table.tableStatus == "Occupied") {
      return Text(
        "Table " +
            widget._index.toString() +
            "\nOrder #" +
            widget._table.order.orderID.toString(),
        textAlign: TextAlign.center,
      );
    } else {
      return Text("Table " + widget._index.toString());
    }
  }
}
