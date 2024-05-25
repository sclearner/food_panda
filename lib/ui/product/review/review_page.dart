import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/components/review_bar/review_bar.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.colorScheme.primary,
            actions:
            [IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))],
            title: Text("REVIEWS"),
            centerTitle: true,
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverList.separated(
              itemBuilder:(context, i) => Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ReviewBar()),
              separatorBuilder: (BuildContext context, int index) => Divider(),),
            ),
        ],
      ),
    );
  }
}
