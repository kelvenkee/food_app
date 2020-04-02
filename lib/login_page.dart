import 'package:flutter/material.dart';
import './setting.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBuilder(),
    );
  }

  Builder buildBuilder() {
    return Builder(
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
                'Sign In',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          buildForm(context),
        ],
      ),
    );
  }

  Form buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 60.0,
          ),
          username(),
          SizedBox(
            height: 20.0,
          ),
          password(),
          SizedBox(
            height: 20,
          ),
          validator(context),
          SizedBox(
            height: 20,
          ),
          Text('Customer? Click here to go back')
        ],
      ),
    );
  }

  ButtonTheme validator(BuildContext context) {
    return ButtonTheme(
      height: 50,
      disabledColor: Colors.blueAccent,
      child: RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            bool result = _performLogin();

            if (result) {
              print("login success");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingPage()),
              );
            } else {
              Scaffold.of(context).showSnackBar(new SnackBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                content: new Text(
                  'Invalid Username & Password',
                  style: TextStyle(color: Colors.red),
                ),
              ));
            }
          }
        },
        child:
            Text('Login', style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }

  TextFormField password() {
    return TextFormField(
      controller: _password,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(fontSize: 20),
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Password';
        }
        return null;
      },
    );
  }

  TextFormField username() {
    return TextFormField(
      controller: _username,
      decoration: InputDecoration(
        labelText: "Username",
        labelStyle: TextStyle(fontSize: 20),
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Username';
        }
        return null;
      },
    );
  }

  bool _performLogin() {
    String username = _username.text;
    String password = _password.text;

    if (username == "admin" && password == "root") {
      return true;
    } else
      return false;
  }
}
