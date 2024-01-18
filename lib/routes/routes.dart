import 'package:clc/pages.dart/spalshScreen/startPage.dart';
import 'package:flutter/material.dart';

class Routes {
  static String startPage = '/';

  static Map<String, WidgetBuilder> route = {
    startPage: (context) => StartPage(),
  };
}
