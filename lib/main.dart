import 'package:flutter/material.dart';
import 'package:food_panda/shared_ui/theme/theme.dart';
import 'package:food_panda/ui/auth/login/login_page.dart';
import 'package:food_panda/ui/main/history/history_page.dart';
import 'package:food_panda/ui/order/billing/billing_page.dart';
import 'package:food_panda/ui/order/book/book_page.dart';
import 'package:food_panda/ui/main/favorites/favorites_page.dart';
import 'package:food_panda/ui/main/home/home_page.dart';
import 'package:food_panda/ui/main/notification/notification_page.dart';
import 'package:food_panda/ui/main/search/search_page.dart';
import 'package:food_panda/ui/main/settings/settings_page.dart';
import 'package:food_panda/ui/product/categories/categories_page.dart';
import 'package:food_panda/ui/product/product/product_page.dart';
import 'package:food_panda/ui/product/review/review_page.dart';
import 'package:food_panda/ui/splash/splash_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: Scaffold(body: HistoryPage()),
    );
  }
}
