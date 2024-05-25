import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/assets/icons.dart';
import 'package:food_panda/shared_ui/components/product_card/product_card.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading:
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
          title: Text("ORDER HISTORY"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
          centerTitle: true,
        ),
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverList.builder(
            itemBuilder: (context, i) => HistoryBadge(),
          ),
        )
      ],
    );
  }
}

class HistoryBadge extends StatelessWidget {
  const HistoryBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterLogo(),
                ProductDetail(height: 60),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(AppIcons.details, color: context.colorScheme.primary,),
                    Text(DateFormat("dd MMM yyyy HH : mm a")
                        .format(DateTime.now()))
                  ],
                ),
                Text("\$1,000,000.00")
              ],
            )
          ],
        ),
      ),
    );
  }
}
