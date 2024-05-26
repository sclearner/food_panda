import 'package:flutter/material.dart';
import 'package:food_panda/shared_ui/assets/icons.dart';

class MainScreen extends StatelessWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  static const _list = [
    BottomNavigationBarItem(icon: Icon(AppIcons.order), label: "Order"),
    BottomNavigationBarItem(icon: Icon(AppIcons.docs), label: "History"),
    BottomNavigationBarItem(icon: Icon(AppIcons.heart), label: "Favorite"),
    BottomNavigationBarItem(icon: Icon(AppIcons.notification), label: "Notification"),
    BottomNavigationBarItem(icon: Icon(AppIcons.account), label: "Settings"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: _list,
              ),
    );
  }
}