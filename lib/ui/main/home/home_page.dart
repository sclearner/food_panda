import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/assets/graphic.dart';
import 'package:food_panda/shared_ui/assets/icons.dart';
import 'package:food_panda/shared_ui/theme/colors.dart';

class HomePage extends StatelessWidget {
  static const double _verticalPadding = 45;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(GraphicAssets.homeBackground))),
        ),
        Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(
                vertical: _verticalPadding, horizontal: 25),
            color: AppColors.blackOverlay,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  leading: Align(
                    alignment: Alignment.center,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: AppColors.viettelRed,
                        borderRadius: BorderRadius.circular(9999)
                      ),
                      transform: Matrix4.translationValues(0, -4, 0),
                    ),
                  ),
                  title: Text(
                    "Hi, VDT",
                    style: context.textTheme.headlineSmall?.copyWith(color: context.colorScheme.onPrimary),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: context.height * 0.55 -
                            kToolbarHeight -
                            _verticalPadding,
                        alignment: Alignment.centerLeft,
                        child: Text("What can\nwe serve you\ntoday?",
                            style: context.textTheme.displayLarge?.copyWith(
                                color: context.colorScheme.onPrimary,
                                )),
                      ),
                      Column(
                        children: [
                          SearchBar(
                            hintText:
                                "Search for address, food, drink and more",
                            leading: Icon(
                              CupertinoIcons.search,
                              color: context.colorScheme.shadow,
                            ),
                            trailing: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Row(
                                    children: [
                                      Icon(
                                        AppIcons.locationPin,
                                        color: context.colorScheme.primary,
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          SizedBox(height: 15),
                          FilledButton(onPressed: () {}, child: Text("SEARCH"))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}
