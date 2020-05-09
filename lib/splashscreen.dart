import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:splashscreen/splashscreen.dart';

class FirstSplashScreen extends StatefulWidget {
  _FirstSplashScreenState createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {
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
        navigateAfterSeconds: loginRoute);
  }
}
