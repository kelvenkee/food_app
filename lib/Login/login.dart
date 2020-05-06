import 'package:flutter/material.dart';
import 'package:food_app/models/mockdata.dart';
import './login_page.dart';
import 'package:food_app/customer_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => ListView(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          children: <Widget>[
            buildColumn(context),
          ],
        ),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 120,
        ),
        Image.asset('assets/foodlogo.png', scale: 1.2),
        SizedBox(
          height: 30,
        ),
        Text(
          'Welcome To Food Ring',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 30,
        ),
        _Customers(),
        SizedBox(
          height: 25,
        ),
        _Employee(),
      ],
    );
  }
}

class _Employee extends StatelessWidget {
  const _Employee({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Text(
          "Employee",
          style: TextStyle(color: Colors.deepOrangeAccent[400]),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return LoginPage();
          }));
        },
      ),
    );
  }
}

class _Customers extends StatelessWidget {
  const _Customers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Text(
          "Customers",
          style: TextStyle(color: Colors.deepOrangeAccent[400]),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return CustomerPage(mockFoodItem);
          }));
        },
      ),
    );
  }
}
