import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/fooditem.dart';

class FoodDetail extends StatefulWidget {
  final FoodItem _foodItems;
  FoodDetail(this._foodItems);
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  var _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true,
          title: Text("Food Detail"),
        ),
        body: Column(children: <Widget>[
          SizedBox(height: 25),
          Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: (Align(
                alignment: Alignment.center,
                child: Image.asset(
                  widget._foodItems.imageName,
                ),
              ))),
          _buildBody(),
        ]));
  }

  Widget _buildBody() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        padding: EdgeInsets.all(28),
        child: Column(
          children: <Widget>[
            Text(
              widget._foodItems.foodName,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget._foodItems.unitPrice.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                _buildCounter(),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(widget._foodItems.foodDescription),
            Expanded(child: SizedBox()),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(vertical: 16),
                    color: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
    // return new Container(
    //   constraints: new BoxConstraints.expand(
    //     height: 200,
    //   ),
    //   alignment: Alignment.bottomLeft,
    //   padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
    //   decoration: new BoxDecoration(
    //     image: new DecorationImage(
    //       image: new AssetImage('assets/slider/slider1.jpg'),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    //   child: new Text(
    //     'Burger',
    //     style: new TextStyle(
    //       fontWeight: FontWeight.bold,
    //       fontSize: 20.0,
    //     ),
    //   ),
    // );
  }

  Widget _buildCounter() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _quantity--;
                  });
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                _quantity.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _quantity++;
                  });
                }),
          ],
        ));
  }
}
