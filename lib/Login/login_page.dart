import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
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
              Image.asset('assets/foodlogo.png', scale: 1.2),
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
          Column(
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Customer? Click '),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'here',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
              Text(' to go back'),
            ],
          )
        ],
      ),
    );
  }

  Future<void> signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        Navigator.pushNamed(context, admin_pageRoute, arguments: user);
      } catch (e) {
        print(e.message);
      }
    }
  }

  ButtonTheme validator(BuildContext context) {
    return ButtonTheme(
      height: 50,
      buttonColor: Colors.redAccent[400],
      disabledColor: Colors.deepOrangeAccent,
      child: RaisedButton(
        onPressed: signIn,
        child:
            Text('Login', style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }

  TextFormField password() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(fontSize: 20),
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Email';
        }
        return null;
      },
      onSaved: (newValue) => _password = newValue,
    );
  }

  TextFormField username() {
    return TextFormField(
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
      onSaved: (newValue) => _email = newValue,
    );
  }

  // bool _performLogin() {
  //   String username = _username.text;
  //   String password = _password.text;

  //   if (username == "admin" && password == "root") {
  //     return true;
  //   } else
  //     return false;
  // }
}
