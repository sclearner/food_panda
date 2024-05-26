import 'package:flutter/cupertino.dart';
import 'package:food_panda/ui/ui.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';
part 'routes.dart';

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: $appRoutes,
);