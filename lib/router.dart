import 'package:flutter/material.dart';
import 'package:food_app/Login/login.dart';
import 'package:food_app/Login/login_page.dart';
import 'package:food_app/Menu/admin_page.dart';
import 'package:food_app/Menu/create_menu.dart';
import 'package:food_app/Menu/view_menu.dart';
import 'package:food_app/Menu/edit_menu.dart';
import 'package:food_app/Menu/view_order.dart';
import 'package:food_app/Settings/help_page.dart';
import 'package:food_app/Settings/profile_page.dart';
import 'package:food_app/Settings/setting.dart';
import 'package:food_app/Settings/setting_password.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/customer_page.dart';
import 'package:food_app/food_detail.dart';
import 'package:food_app/splashscreen.dart';
import 'package:food_app/models/mockdata.dart';
import 'cart.dart';

Route<dynamic> createRoute(settings) {
  final arguments = settings.arguments;
  switch (settings.name) {
    case splashScreenRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: splashScreenRoute),
          builder: (context) => FirstSplashScreen());
    case loginRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: loginRoute),
          builder: (context) => Login());
    case login_pageRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: login_pageRoute),
          builder: (context) => LoginPage());
    case admin_pageRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: admin_pageRoute),
          builder: (context) => AdminPage());
    case view_menuRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: view_menuRoute),
          builder: (context) => ViewMenu(arguments));
    case edit_menuRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: edit_menuRoute),
          builder: (context) => EditMenu(arguments));
    case create_menuRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: create_menuRoute),
          builder: (context) => CreateMenu(arguments));
    case view_orderRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: view_orderRoute),
          builder: (context) => ViewOrder(arguments));
    case help_pageRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: help_pageRoute),
          builder: (context) => HelpPage());
    case profile_pageRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: profile_pageRoute),
          builder: (context) => ProfilePage());
    case setting_passwordRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: setting_passwordRoute),
          builder: (context) => SettingPasswordPage());
    case settingRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: settingRoute),
          builder: (context) => SettingPage());
    case customerPageRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: customerPageRoute),
          builder: (context) => CustomerPage(mockFoodItem));
    case food_detailRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: food_detailRoute),
          builder: (context) => FoodDetail(arguments));
    case cartRoute:
      return MaterialPageRoute(
          settings: RouteSettings(name: cartRoute),
          builder: (context) => Cart());
  }
  return null;
}
