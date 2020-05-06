import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodDetail extends StatefulWidget {
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int _quantity = 0;
  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text("Food Detail"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return new Container(
      constraints: new BoxConstraints.expand(
        height: 200,
      ),
      alignment: Alignment.bottomLeft,
      padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/slider/slider1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Text(
        'Burger',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
