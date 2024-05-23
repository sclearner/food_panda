import 'package:flutter/material.dart';
import 'package:food_panda/shared_ui/theme/theme.dart';
import 'package:food_panda/ui/auth/login/login_page.dart';
import 'package:food_panda/ui/main/home/home_page.dart';
import 'package:food_panda/ui/main/search/search_page.dart';
import 'package:food_panda/ui/main/settings/settings_page.dart';
import 'package:food_panda/ui/splash/splash_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: appTheme,
      home: SettingsPage(),
    );
  }
}
