import 'package:flutter/material.dart';
import 'review_star.dart';

///Thanh hiển thị đánh giá theo mức
class ReviewStarBar extends StatelessWidget {
  final int maxCount;
  final double count;

  const ReviewStarBar({super.key, this.maxCount = 5, this.count = 0})
      : assert(maxCount > 0), assert(count > 0 && count <= maxCount);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(maxCount, (index) =>
          ReviewStar(
            active: count - index,
          )),
    );
  }
}