import 'package:flutter/material.dart';
import 'package:food_app/Login/login.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new FoodApp(),
  ));
}

class FoodApp extends StatefulWidget {
  _FoodAppState createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  Widget build(BuildContext context) {
    return buildSplashScreen();
  }

  SplashScreen buildSplashScreen() {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.white,
      image: Image.asset("assets/delivery.gif"),
      loadingText: Text("Presented by Team Coconut"),
      loaderColor: Colors.black,
      photoSize: 150.0,
      navigateAfterSeconds: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
      title: 'Food Application',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
