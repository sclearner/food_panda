import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/components/dish_bar/dish_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const List<Tab> _tabs = [
    Tab(text: "STARTERS"),
    Tab(text: "MAINS"),
    Tab(text: "SIDES"),
    Tab(text: "DESSERTS")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: _tabs.length,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              stretch: true,
              backgroundColor: context.colorScheme.primary,
              actions: [
                IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
              ],
              title: Text("ALL CATEGORIES"),
              centerTitle: true,
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: ColoredBox(
                    color: context.colorScheme.surface,
                    child: TabBar(
                      tabs: _tabs,
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      labelColor: context.colorScheme.onSurface,
                      labelStyle: context.textTheme.titleMedium,
                      unselectedLabelColor: context.colorScheme.shadow,
                      indicatorColor: context.colorScheme.secondary,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 3,
                    ),
                  )),
            ),

            SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: SliverList.separated(
                itemBuilder: (context, i) => Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: DishBar()),
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
