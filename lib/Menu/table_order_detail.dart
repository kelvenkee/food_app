import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/order.dart';

class TableOrderDetail extends StatefulWidget {
  final Order _order;
  final int _index;
  TableOrderDetail(this._order,this._index);
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
        title: Text("Order Detail for Table "+widget._index.toString()),
      ),
    );
  }
}
