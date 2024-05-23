import 'package:flutter/material.dart';
import 'package:food_panda/extensions/theme.dart';

///Hình sao cho việc đánh giá, màu mặc định là [primary]
///khi kích hoạt và [shadow] khi không kích hoạt
class ReviewStar extends StatelessWidget {
  Color? activeColor;
  Color? inactiveColor;
  final bool active;
  final double size;

  ReviewStar(
      {super.key, this.activeColor, this.inactiveColor, this.active = false, this.size = 14});

  @override
  Widget build(BuildContext context) {
    activeColor ??= context.colorScheme.primary;
    inactiveColor ??= context.colorScheme.shadow;
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size / 14 * 3),
      decoration: ShapeDecoration(
          color: active ? activeColor : inactiveColor,
          shape: StarBorder(
            pointRounding: 0.5
          )),
    );
  }
}
