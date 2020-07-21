import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:badges/badges.dart';
import 'package:food_app/models/orderitem.dart';
import 'package:food_app/service/fooditem_data_service.dart';

import '../models/fooditem.dart';
import '../service/fooditem_data_service.dart';

class CustomerPage extends StatefulWidget {

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  List<FoodItem> _foodItems;
  final dataService = FoodItemDataService();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return FutureBuilder<List<FoodItem>>(
        future: dataService.getAllFoodItem(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _foodItems = snapshot.data;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text('Menu'),
        actions: <Widget>[
          Badge(
            position: BadgePosition.topRight(top: 0, right: 3),
            badgeContent: Text(orderItems.length.toString()),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, cartRoute);
              },
              tooltip: 'Checkout',
            ),
          ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                contentPadding: const EdgeInsets.all(5.0),
                title: Text(_foodItems[index].foodName,
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
                          "Price: RM" +
                              _foodItems[index].unitPrice.toStringAsFixed(2),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          _foodItems[index].foodDescription,
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
                    child: Image.asset(_foodItems[index].imageName,
                        fit: BoxFit.cover, alignment: Alignment.center),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    food_detailRoute,
                    arguments: _foodItems[index],
                  );
                },
              ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.blueGrey,
              ),
          itemCount: _foodItems.length),
    );
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching food item data....Please wait'),
          ],
        ),
      ),
    );
  }
}
