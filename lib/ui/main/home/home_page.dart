import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/assets/graphic.dart';
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
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(GraphicAssets.homeBackground))),
        ),
        Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: _verticalPadding, horizontal: 25),
            color: AppColors.blackOverlay,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                    backgroundColor: Colors.transparent,
                    leading: Transform(
                      transform: Matrix4.translationValues(0, -4, 0),
                      child: CircleAvatar(backgroundColor: AppColors.viettelRed),
                    ),
                    title: Text("Hi, VDT", style: TextStyle(color: context.colorScheme.onPrimary),),
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
                            style: TextStyle(
                                color: context.colorScheme.onPrimary)),
                      ),
                      Column(
                        children: [
                          SearchBar(
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
                                        Icons.location_pin,
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
