import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_panda/blocs/search_bloc/search_bloc.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/assets/graphic.dart';
import 'package:food_panda/shared_ui/assets/icons.dart';
import 'package:food_panda/shared_ui/components/user_avatar/user_avatar.dart';
import 'package:food_panda/shared_ui/theme/colors.dart';

class HomeScreen extends StatelessWidget {
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
                    child: UserAvatar(),
                  ),
                  title: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Text(
                        "Hi, ${state.user.name}",
                        style: context.textTheme.headlineSmall
                            ?.copyWith(color: context.colorScheme.onPrimary),
                      );
                    }
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
                          HomeSearchBar(),
                          const SizedBox(height: 15),
                          FilledButton(
                              onPressed: () {
                                SearchFoundRoute(input: context.read<SearchBloc>().state.keyword).push(context);
                              }, child: const Text("SEARCH"))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchBloc>();
    return BlocBuilder<SearchBloc, SearchState>(
        bloc: bloc,
        builder: (context, state) {
      return SearchBar(
        hintText: "Search for address, food, drink and more",
        onChanged: (keyword) {
          bloc.add(SearchEditingKeyword(keyword));
        },
        onSubmitted: (keyword) {
          if (keyword.isNotEmpty) SearchFoundRoute(input: keyword).push(context);
        },
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
      );
    });
  }
}
