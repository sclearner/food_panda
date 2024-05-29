import 'package:flutter/material.dart';
import 'package:food_panda/ui/splash/splash_page.dart';

class SplashRoute {
  static final _splashRoute = MaterialPageRoute(builder: (context) => SplashScreen());

  static void show(BuildContext context) {
    Navigator.of(context).push(_splashRoute);
    willShow = false;
  }

  static void destroy(BuildContext context) {
    if (ModalRoute.of(context) == _splashRoute) {
      Navigator.of(context).pop();
    }
  }

  static bool willShow = true;
}
