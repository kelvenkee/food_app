import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import '../Menu/view_order.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:food_app/models/mockdata.dart';

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
          Padding(
              padding: const EdgeInsets.only(top: 1.0, left: 1.0),
              child: ListTile(
                title: Text('Menu',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0)),
                trailing:
                    Icon(Icons.keyboard_arrow_right, color: Colors.blueGrey),
                onTap: () {
                  Navigator.pushNamed(context, view_menuRoute,
                      arguments: mockFoodItem);
                },
              )),
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
                title: Text('Orders',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0)),
                trailing: Text('View All',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0)),
                onTap: () {
                  Navigator.pushNamed(context, view_orderRoute,
                      arguments: mockTable);
                },
              )),
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
