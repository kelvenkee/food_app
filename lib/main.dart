import 'package:flutter/material.dart';
import 'package:food_app/router.dart';
// import 'package:food_app/Login/login.dart';
import 'constant.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: new FoodApp(),
    initialRoute: splashScreenRoute,
    onGenerateRoute: createRoute,
  ));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return buildMaterialApp();
//   }

//   MaterialApp buildMaterialApp() {
//     return MaterialApp(
//       title: 'Food Application',
//       debugShowCheckedModeBanner: false,
//       home: Login(),
//     );
//   }
// }
