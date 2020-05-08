import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/order.dart';

class OrderDetail extends StatefulWidget {
  final Order _order;
  final int _index;
  OrderDetail(this._order,this._index);
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
        title: Text("Order Detail for Order "+ (widget._index+1).toString()),
      ),
    );
  }
}

