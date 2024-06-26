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
        GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
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
                                  String keyword = context.read<SearchBloc>().state.keyword;
                                  if (keyword.isEmpty) return;
                                  context.read<SearchBloc>().add(SearchRequest());
                                  SearchRoute(keyword).push(context);
                                }, child: const Text("SEARCH"))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )),
        )
      ],
    );
  }
}

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  late TextEditingController _controller;

  SearchBloc get bloc => context.read<SearchBloc>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
        bloc.add(SearchEditingKeyword(_controller.text));
    });
    bloc.stream.listen((state) {
      _controller.text = state.keyword;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        bloc: bloc,
        builder: (context, state) {
      return SearchBar(
        controller: _controller,
        hintText: "Search for address, food, drink and more",
        onSubmitted: (keyword) {
          if (keyword.isEmpty) return;
          bloc.add(SearchRequest());
          SearchRoute(keyword).push(context);
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
