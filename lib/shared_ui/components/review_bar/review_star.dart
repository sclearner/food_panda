import 'package:flutter/material.dart';
import 'package:food_panda/extensions/theme.dart';

///Hình sao cho việc đánh giá, màu mặc định là [primary]
///khi kích hoạt và [shadow] khi không kích hoạt
class ReviewStar extends StatelessWidget {
  late final Color? activeColor;
  late final Color? inactiveColor;
  final double active;
  final double size;

  ReviewStar(
      {super.key, this.activeColor, this.inactiveColor, this.active = 0, this.size = 10});

  @override
  Widget build(BuildContext context) {
    activeColor ??= context.colorScheme.primary;
    inactiveColor ??= context.colorScheme.shadow;
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.all(size / 14 * 1.5),
      decoration: ShapeDecoration(
          gradient: LinearGradient(
            colors: [activeColor!, activeColor!, inactiveColor!, inactiveColor!],
            stops: [0, active.clamp(0, 1), active.clamp(0,1), 1]
          ),
          shape: const StarBorder(
            pointRounding: 0.5
          )),
    );
  }
}
