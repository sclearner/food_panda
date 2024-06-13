import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/components/review_bar/review_bar.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.colorScheme.primary,
            actions:
            [IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search))],
            title: const Text("REVIEWS"),
            centerTitle: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverList.separated(
              itemBuilder:(context, i) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const ReviewBar()),
              separatorBuilder: (BuildContext context, int index) => const Divider(),),
            ),
        ],
      ),
    );
  }
}
