import 'package:flutter/material.dart';
import 'review_star.dart';

///Thanh hiển thị đánh giá theo mức
class ReviewBar extends StatelessWidget {
  final int maxCount;
  final num count;

  const ReviewBar({super.key, this.maxCount = 5, this.count = 0})
      : assert(maxCount > 0), assert(count > 0 && count <= maxCount);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(maxCount, (index) =>
          ReviewStar(
            active: index < count,
          )),
    );
  }
}