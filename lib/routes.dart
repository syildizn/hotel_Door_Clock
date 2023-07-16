import 'package:flutter/material.dart';
import 'package:wifilockproject/main.dart';
import 'package:wifilockproject/screens/HomePageScreen.dart';
import 'package:wifilockproject/screens/SetPasswordScreen.dart';
import 'package:wifilockproject/screens/SplashScreen.dart';


Map<String, WidgetBuilder> routes = {
  //all screens will be registered here like manifest in android
  SetPassword.routeName: (context) => SetPassword(),
  HomePage.routeName: (context) => HomePage(),
  SplashScreen.routeName: (context) => SplashScreen(),

};