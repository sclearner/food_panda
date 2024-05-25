import 'package:flutter/material.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/components/review_bar/review_bar.dart';

/// Thẻ chứa thông tin của sản phẩm
class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 161,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://cellphones.com.vn/sforum/wp-content/uploads/2023/09/cach-nuong-pizza-thumbnail.jpg"),
                    fit: BoxFit.cover)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Pizza Boscaiola",
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: context.colorScheme.onSurface),
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "Mozzarella, ciuperci, bacon, oregano"),
                          TextSpan(text: " – "),
                          TextSpan(text: "1000g")
                        ]),
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: context.colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const ReviewBar(count: 3.4),
                      const SizedBox(width: 5),
                      Text(
                        "286 reviews",
                        style: context.textTheme.labelSmall
                            ?.copyWith(color: context.colorScheme.shadow),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
