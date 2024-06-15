// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_panda/blocs/search_bloc/search_bloc.dart';
import 'package:food_panda/models/menu.dart';
import 'package:food_panda/repositories/auth_repo.dart';
import 'package:food_panda/routes/splash_route.dart';
import 'package:food_panda/ui/order/success/order_success_page.dart';
import 'package:food_panda/ui/ui.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';
part 'routes.dart';

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  observers: [],
  routes: $appRoutes,
);

// navigatorContainerBuilder: (BuildContext context,
// StatefulNavigationShell navigationShell, List<Widget> children) {
// return MainScreen(navigationShell: navigationShell, children: children);
// },
