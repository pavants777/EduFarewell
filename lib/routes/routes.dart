import 'package:clc/pages.dart/homepages/homepage.dart';
import 'package:clc/pages.dart/splashScreen/startPage.dart';
import 'package:flutter/material.dart';

class Routes {
  static String startPage = '/start';
  static String homePage = '/home';

  static Map<String, WidgetBuilder> route = {
    startPage: (context) => StartPage(),
    homePage: (context) => HomePageStart(),
  };
}
