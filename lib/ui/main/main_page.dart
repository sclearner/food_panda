import 'package:flutter/material.dart';
import 'package:food_panda/shared_ui/assets/icons.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  const MainScreen(
      {super.key, required this.navigationShell, required this.children});

  static const _list = [
    BottomNavigationBarItem(icon: Icon(AppIcons.order), label: "Order"),
    BottomNavigationBarItem(icon: Icon(AppIcons.docs), label: "History"),
    BottomNavigationBarItem(icon: Icon(AppIcons.heart), label: "Favorite"),
    BottomNavigationBarItem(
        icon: Icon(AppIcons.notification), label: "Notification"),
    BottomNavigationBarItem(icon: Icon(AppIcons.account), label: "Settings"),
  ];

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(
        initialIndex: widget.navigationShell.currentIndex,
        length: widget.children.length,
        vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: TabBarView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: widget.children),
      bottomNavigationBar: BottomNavigationBar(
        items: MainScreen._list,
        onTap: switchTab,
        currentIndex: widget.navigationShell.currentIndex,
      ),
    );
  }

  void switchTab(dynamic index) {
    if (index is MainScreenChildren) index = MainScreenChildren.values.indexOf(index);
    setState(() {
      widget.navigationShell.goBranch(index, initialLocation: false);
      _controller.animateTo(index, curve: Curves.decelerate);
    });
  }

  @override
  bool get wantKeepAlive => true;
}

enum MainScreenChildren {home, history, favorites, notifications, settings}