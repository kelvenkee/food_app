import 'package:flutter/material.dart';
import 'package:food_app/router.dart';
import 'constant.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: splashScreenRoute,
    onGenerateRoute: createRoute,
  ));
}
