import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/components/product_card/product_card.dart';
import 'package:food_panda/ui/search/search_recommend_page.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.colorScheme.primary,
            leading:
                IconButton(onPressed: () {
                  SearchRecommendRoute().go(context);
                }, icon: Icon(CupertinoIcons.search)),
            title: Text("FAVORITES"),
            centerTitle: true,
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, i) => Container(
                  height: 295,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ProductCard())),
            ),
          )
        ],
      ),
    );
  }
}
