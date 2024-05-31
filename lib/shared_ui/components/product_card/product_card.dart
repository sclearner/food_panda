import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/models/menu.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/components/review_bar/review_star_bar.dart';

/// Thẻ chứa thông tin của sản phẩm
class ProductCard extends StatelessWidget {
  late final Menu menu;

  ProductCard({super.key, Menu? menu}) : menu = menu ?? Menu.test;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          ProductRoute(productId: '123', $extra: menu).push(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 161,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  image: DecorationImage(
                      image: NetworkImage(
                          menu.gallery?[0] ?? "https://cellphones.com.vn/sforum/wp-content/uploads/2023/09/cach-nuong-pizza-thumbnail.jpg"),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductDetail(menu: menu),
              )
            )
          ],
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  late final Menu menu;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final double? height;
  ProductDetail({super.key, this.titleStyle, this.descriptionStyle, this.height, Menu? menu}) : menu = menu ?? Menu.test;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                menu.title,
                style: titleStyle ?? context.textTheme.titleLarge
                    ?.copyWith(color: context.colorScheme.onSurface),
              ),
              Text(
                // TextSpan(children: [
                //   TextSpan(text: "Mozzarella, ciuperci, bacon, oregano"),
                //   TextSpan(text: " – "),
                //   TextSpan(text: "1000g")
                // ]),
                menu.subtitle,
                style: descriptionStyle ?? context.textTheme.bodySmall
                    ?.copyWith(color: context.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ReviewStarBar(count: menu.reviewStar ?? Random().nextDouble()*5),
              const SizedBox(width: 5),
              Text(
                "${menu.reviewCount ?? "No"} reviews",
                style: context.textTheme.labelSmall
                    ?.copyWith(color: context.colorScheme.shadow),
              )
            ],
          ),
        ],
      ),
    );
  }
}