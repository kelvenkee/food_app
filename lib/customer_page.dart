import 'package:flutter/material.dart';
import 'package:food_app/Menu/edit_menu.dart';
import 'package:food_app/food_detail.dart';

class CustomerPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true,
          title: Text('Menu'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: null,
              tooltip: 'Checkout',
            )
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: FittedBox(
                  child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FoodDetail()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: myDetailsContainer1(),
                          ),
                          Container(
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(24.0),
                              child: Image(
                                  width: 150,
                                  height: 100,
                                  fit: BoxFit.contain,
                                  alignment: Alignment.topRight,
                                  image:
                                      AssetImage('assets/slider/slider1.jpg')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
