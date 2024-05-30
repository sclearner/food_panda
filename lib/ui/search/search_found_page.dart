import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/search_bloc/search_bloc.dart';
import 'package:food_panda/blocs/search_view_cubit/search_view_cubit.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/shared_ui/components/product_card/product_card.dart';

class SearchFoundPage extends StatelessWidget {
  _gridDelegate(BuildContext context) =>
      SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: max(context.width ~/ 220, 1),
          mainAxisExtent: 268,
          crossAxisSpacing: 20,
          mainAxisSpacing: 25);

  final _listDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      crossAxisSpacing: 25,
      mainAxisExtent: 268,
      mainAxisSpacing: 25);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: context.read(),
      builder: (context, state) {
        if (state.status == SearchStatus.finding) return Center(child: CircularProgressIndicator());
        return BlocBuilder<SearchViewCubit, SearchViewMode>(
          builder: (context, mode) {
            return GridView.builder(
                key: ValueKey("search-result-list"),
                shrinkWrap: true,
                itemCount: state.menu.length,
                itemBuilder: (context, i) => ProductCard(menu: state.menu[i]),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                gridDelegate: mode == SearchViewMode.list ? _listDelegate : _gridDelegate(context));
          }
        );
      }
    );
  }
}
