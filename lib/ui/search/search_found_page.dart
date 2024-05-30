import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/search_bloc/search_bloc.dart';
import 'package:food_panda/blocs/search_view_cubit/search_view_cubit.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/shared_ui/components/product_card/product_card.dart';

class SearchFoundPage extends StatefulWidget {
  @override
  State<SearchFoundPage> createState() => _SearchFoundPageState();
}

class _SearchFoundPageState extends State<SearchFoundPage> {
  late final ScrollController _controller;
  bool _needMoreData = false;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  _gridDelegate(BuildContext context) =>
      SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: max(context.width ~/ 190, 1),
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
    SearchBloc bloc = context.read();
    return BlocConsumer<SearchBloc, SearchState>(
        bloc: bloc,
        listener: (context, state) {
          if (state.status == SearchStatus.found) _needMoreData = true;
        },
        builder: (context, state) {
          return BlocBuilder<SearchViewCubit, SearchViewMode>(
              builder: (context, mode) {
            return CustomScrollView(
              controller: _controller,
              slivers: [
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  sliver: SliverGrid.builder(
                      key: ValueKey("search-result-list"),
                      itemCount: state.menu.length,
                      itemBuilder: (context, i) =>
                          ProductCard(menu: state.menu[i]),
                      gridDelegate: mode == SearchViewMode.list
                          ? _listDelegate
                          : _gridDelegate(context)),
                ),
                SliverToBoxAdapter(
                  child: (state.status == SearchStatus.finding)
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(),
                )
              ],
            );
          });
        });
  }

  void _onScroll() {
    if (_isBottom && _needMoreData) {
      _needMoreData = false;
      context.read<SearchBloc>().add(const SearchRequestMore());
    }
  }

  bool get _isBottom {
    if (!_controller.hasClients) return false;
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.offset;
    return currentScroll >= (maxScroll * 0.8);
  }
}
