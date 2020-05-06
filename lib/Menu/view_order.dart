import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewOrder extends StatefulWidget {
  final List _table;
  ViewOrder(this._table);
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
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(widget._table.length, (index) {
          return Center(
            child: tableItems(widget._table[index].tableImageName,
                widget._table[index].tableStatus, index),
          );
        }),
      ),
    );
  }

  
  Widget tableItems(String tableImageName, String tableStatus, int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          gradient: new LinearGradient(
            colors: [Colors.grey, Colors.black],
            begin: Alignment.centerLeft,
            end: new Alignment(1.0, 1.0),
          )),
      child: Stack(children: <Widget>[
        Opacity(
          opacity: 0.8,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                image: AssetImage(
                  tableImageName,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 50,),
              child: Text("Table " + index.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, bottom: 3),
              child: Text(tableStatus,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        )
      ]),
    );
  }
}
