import 'package:flutter/material.dart';
import 'package:food_app/Login/login.dart';
import 'package:food_app/Login/login_page.dart';
import 'package:food_app/Menu/admin_page.dart';
import 'package:food_app/Menu/view_menu.dart';
import 'package:food_app/Menu/view_order.dart';
import 'package:food_app/Settings/help_page.dart';
import 'package:food_app/Settings/profile_page.dart';
import 'package:food_app/Settings/setting.dart';
import 'package:food_app/Settings/setting_password.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/splashscreen.dart';
import 'package:food_app/models/mockdata.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case splashScreenRoute:
      return MaterialPageRoute(builder: (context) => FirstSplashScreen());
    case loginRoute:
      return MaterialPageRoute(builder: (context) => Login());
    case login_pageRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case admin_pageRoute:
      return MaterialPageRoute(builder: (context) => AdminPage());
    case view_menuRoute:
      return MaterialPageRoute(builder: (context) => ViewMenu(mockFoodItem));
    case view_orderRoute:
      return MaterialPageRoute(builder: (context) => ViewOrder(mockTable));
    case help_pageRoute:
      return MaterialPageRoute(builder: (context) => HelpPage());
    case profile_pageRoute:
      return MaterialPageRoute(builder: (context) => ProfilePage());
    case setting_passwordRoute:
      return MaterialPageRoute(builder: (context) => SettingPasswordPage());
    case settingRoute:
      return MaterialPageRoute(builder: (context) => SettingPage());
  }
  return null;
}
