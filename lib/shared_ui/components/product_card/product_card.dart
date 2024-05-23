import 'package:flutter/material.dart';
import 'package:food_panda/shared_ui/components/review_bar/review_bar.dart';

/// Thẻ chứa thông tin của sản phẩm
class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pizza Boscaiola"),
                Text.rich(TextSpan(children: [
                  TextSpan(text: "Mozzarella, ciuperci, bacon, oregano"),
                  TextSpan(text: " – "),
                  TextSpan(text: "1000g")
                ])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReviewBar(count: 3.4),
                    Text("286 reviews")
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
