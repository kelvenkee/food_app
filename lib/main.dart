import 'package:flutter/material.dart';
import 'package:food_app/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Application',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
