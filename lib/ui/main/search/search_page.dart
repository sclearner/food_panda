import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/components/product_card/product_card.dart';

part 'search_appbar.dart';

class SearchPage extends StatelessWidget {
  static const _tabs = ['Nearby', 'Popular', 'Top review', 'Recommend'];

  const SearchPage({super.key});

  final _gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 190,
      crossAxisSpacing: 25,
      childAspectRatio: 167 / 268,
      mainAxisSpacing: 25);

  SliverGridDelegate _listDelegate(BuildContext context) => SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1, crossAxisSpacing: 25,
      childAspectRatio: context.width / 268,
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
                  gridDelegate: Random().nextBool() ? _listDelegate(context): _gridDelegate),
            )
          ],
        ),
      ),
    );
  }
}
