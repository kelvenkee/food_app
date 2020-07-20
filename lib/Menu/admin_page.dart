import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:food_app/models/diningtable.dart';
import 'package:food_app/models/mockdata.dart';

import '../models/mockdata.dart';
import 'table_order_detail.dart';

class AdminPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text('FoodRing'),
        actions: <Widget>[
          ShowNotification(),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Kang Wei Kiat',
                style: TextStyle(fontSize: 22.0, color: Colors.white)),
            accountEmail: Text('TeamCoconut@gmail.com'),
            currentAccountPicture: GestureDetector(
                child: CircleAvatar(
              backgroundColor: Colors.white,
              // child: Icon(Icons.android, size: 60.0, color: Colors.black),
              backgroundImage: AssetImage('assets/profile.png'),
            )),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.orange[300], Colors.deepOrangeAccent])),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, profile_pageRoute);
            },
            child: ListTile(
              title:
                  Text('User Profile', style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.person, color: Colors.black),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, settingRoute);
            },
            child: ListTile(
              title: Text('Settings', style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.settings, color: Colors.black),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, help_pageRoute);
            },
            child: ListTile(
              title: Text('Help', style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.help_outline, color: Colors.black),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: ListTile(
              title: Text('Log Out', style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.exit_to_app, color: Colors.black),
            ),
          ),
        ],
      )),
      body: ListView(
        children: <Widget>[
          Container(
            height: 225.0,
            child: Carousel(
              overlayShadow: false,
              borderRadius: true,
              boxFit: BoxFit.cover,
              autoplay: true,
              dotSize: 5.0,
              indicatorBgPadding: 9.0,
              images: [
                new AssetImage('assets/slider/slider1.jpg'),
                new AssetImage('assets/slider/slider2.jpg'),
                new AssetImage('assets/slider/slider3.jpg'),
                new AssetImage('assets/slider/slider4.jpg'),
                new AssetImage('assets/slider/slider5.jpg'),
              ],
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(microseconds: 1500),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 1.0, left: 1.0),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Menu',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0)),
                    Row(children: <Widget>[
                      Text('View All',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0)),
                      Icon(Icons.keyboard_arrow_right, color: Colors.blueGrey),
                    ])
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, view_menuRoute);
                },
              )),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: 3,
            indent: 0,
            endIndent: 0,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 1.0, left: 1.0),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Orders',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0)),
                    Row(
                      children: <Widget>[
                        Text('View All',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0)),
                        Icon(Icons.keyboard_arrow_right,
                            color: Colors.blueGrey),
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, view_orderRoute,
                      arguments: mockOrder);
                },
              )),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: 3,
            indent: 0,
            endIndent: 0,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 1.0, left: 1.0),
              child: ListTile(
                title: Text('Tables',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0)),
              )),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            children: List.generate(mockTable.length, (_index) {
              return Center(
                child: TableItems(_index),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class ShowNotification extends StatelessWidget {
  Widget build(BuildContext context) {
    return (IconButton(
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("New order from Table 3, please check."),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red[600],
          ));
        },
        icon: Stack(
          children: <Widget>[
            Icon(Icons.notifications, color: Colors.white),
            Positioned(
                left: 16.0,
                child: Icon(
                  Icons.brightness_1,
                  color: Colors.red,
                  size: 9.0,
                ))
          ],
        )));
  }
}

class TableItems extends StatefulWidget {
  final int _index;
  TableItems(this._index);
  @override
  _TableItemsState createState() => _TableItemsState();
}

class _TableItemsState extends State<TableItems> {
  void _navigate(index) async {
    final DiningTable returnData = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TableOrderDetail(
              DiningTable.copy(mockTable[widget._index]))),
    );

    if (returnData != null) {
      setState(() => mockTable[widget._index] = returnData);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  mockTable[widget._index].tableImageName,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text((widget._index + 1).toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Center(
                child: Text(mockTable[widget._index].tableStatus,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            _navigate(widget._index);
          },
        ),
      ]),
    );
  }
}
