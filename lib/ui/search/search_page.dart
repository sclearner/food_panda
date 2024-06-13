import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/search_appbar_cubit/search_appbar_cubit.dart';
import 'package:food_panda/blocs/search_bloc/search_bloc.dart';
import 'package:food_panda/blocs/search_view_cubit/search_view_cubit.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/assets/icons.dart';
import 'package:food_panda/ui/search/search_found_page.dart';
import 'package:food_panda/ui/search/search_recommend_page.dart';
import 'package:go_router/go_router.dart';

part 'search_appbar.dart';

class SearchScreen extends StatefulWidget {
  static const _tabs = ['Nearby', 'Popular', 'Top review', 'Recommend'];
  final String? keyword;

  const SearchScreen({super.key, this.keyword});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: SearchScreen._tabs.length,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SearchViewCubit()),
          BlocProvider(create: (_) => SearchAppbarCubit(context.read<SearchBloc>().state.keyword.isEmpty)),
        ],
        child: BlocBuilder<SearchAppbarCubit, bool>(
          builder: (context, isEditing) {
            return BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return Scaffold(
                  extendBody: true,
                  extendBodyBehindAppBar: true,
                  appBar: SearchEditingAppBar(context: context, tabLabels: SearchScreen._tabs, isCollapsed: isEditing),
                  body: isEditing ? const SearchRecommendPage() : const SearchFoundPage(),

                );
              }
            );
          }
        ),
      ),
    );
  }
}
