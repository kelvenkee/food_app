import 'package:flutter/material.dart';
import '../constant.dart';

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
      bottomNavigationBar: _Employee(),
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
        padding: const EdgeInsets.all(0),
        color: Colors.white,
        child: Text.rich(
          TextSpan(
            text: 'Log in as  ',
            style: TextStyle(fontSize: 14),
            children: <TextSpan>[
              TextSpan(
                  text: 'employee',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  )),
              TextSpan(
                text: '?',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            login_pageRoute,
          );
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
      width: null,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(28.0),
          side: BorderSide(color: Colors.black),
        ),
        padding: const EdgeInsets.all(16.0),
        color: Colors.red[300],
        child: Text(
          "Let's Start Order",
          style: TextStyle(color: Colors.white,fontSize: 24),
        ),
        onPressed: () {
          Navigator.pushNamed(context, customerPageRoute);
        },
      ),
    );
  }
}
