import 'package:flutter/material.dart';
import 'package:food_panda/extensions/theme.dart';

class DishBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://cdn.tgdd.vn/Files/2021/09/14/1382544/lau-sukiyaki-la-gi-tim-hieu-cach-nau-lau-sukiyaki-nhat-ban-202201031105547812.jpg'))),
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Viettel Hot Pot",
                    style: context.textTheme.labelMedium,
                  ),
                  Text(
                    "\$100.00",
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: context.colorScheme.onSurfaceVariant),
                  )
                ],
              ),
            )),

      ],
    );
  }
}