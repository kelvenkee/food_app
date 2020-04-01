import 'package:flutter/material.dart';
import './login_page.dart';

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
            Column(
              children: <Widget>[
                SizedBox(
                  height: 120,
                ),
                Icon(
                  Icons.fastfood,
                  color: Colors.black,
                  size: 80.0,
                ),
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
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.white,
                    child: Text(
                      "Food Bangers",
                      style: TextStyle(color: Colors.pink[400]),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.white,
                    child: Text(
                      "Food Bangers",
                      style: TextStyle(color: Colors.pink[100]),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return LoginPage();
                      }));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
