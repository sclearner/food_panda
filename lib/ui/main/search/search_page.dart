import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/assets/icons.dart';
import 'package:food_panda/shared_ui/components/product_card/product_card.dart';

part 'search_appbar.dart';

class SearchScreen extends StatelessWidget {
  static const _tabs = ['Nearby', 'Popular', 'Top review', 'Recommend'];

  SearchScreen({super.key});

  _gridDelegate(BuildContext context) => SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: max(context.width ~/ 220, 1),
      mainAxisExtent: 268,
      crossAxisSpacing: 20,
      mainAxisSpacing: 25);

  final _listDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1, crossAxisSpacing: 25,
      mainAxisExtent: 268,
      mainAxisSpacing: 25);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SearchAppbar(context: context, tabLabels: _tabs,),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              sliver: SliverGrid(
                  delegate:
                  SliverChildBuilderDelegate((context, i) => ProductCard()),
                  gridDelegate: false ? _listDelegate: _gridDelegate(context)),
            )
          ],
        ),
      ),
    );
  }
}
