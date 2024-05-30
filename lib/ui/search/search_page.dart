import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/search_bloc/search_bloc.dart';
import 'package:food_panda/blocs/search_view_cubit/search_view_cubit.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/assets/icons.dart';
import 'package:go_router/go_router.dart';

part 'search_appbar.dart';

class SearchScreen extends StatelessWidget {
  static const _tabs = ['Nearby', 'Popular', 'Top review', 'Recommend'];
  final Widget content;

  SearchScreen({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: BlocProvider(
        create: (_) => SearchViewCubit(),
        child: Builder(
          builder: (context) {
            return Scaffold(
              extendBody: true,
              appBar: SearchAppbar(context: context, tabLabels: _tabs,),
              body: content,
            );
          }
        ),
      ),
    );
  }
}
