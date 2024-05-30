// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $loginRoute,
      $mainRoute,
      $searchRoute,
      $productRoute,
      $billingSettingsRoute,
    ];

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      parentNavigatorKey: LoginRoute.$parentNavigatorKey,
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainRoute => StatefulShellRouteData.$route(
      parentNavigatorKey: MainRoute.$parentNavigatorKey,
      navigatorContainerBuilder: MainRoute.$navigatorContainerBuilder,
      factory: $MainRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/',
              factory: $HomeRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/history',
              factory: $HistoryRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/favorite',
              factory: $FavoritesRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/notifications',
              factory: $NotificationsRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/settings',
              factory: $SettingsRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HistoryRouteExtension on HistoryRoute {
  static HistoryRoute _fromState(GoRouterState state) => HistoryRoute();

  String get location => GoRouteData.$location(
        '/history',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FavoritesRouteExtension on FavoritesRoute {
  static FavoritesRoute _fromState(GoRouterState state) => FavoritesRoute();

  String get location => GoRouteData.$location(
        '/favorite',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NotificationsRouteExtension on NotificationsRoute {
  static NotificationsRoute _fromState(GoRouterState state) =>
      NotificationsRoute();

  String get location => GoRouteData.$location(
        '/notifications',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $searchRoute => ShellRouteData.$route(
      parentNavigatorKey: SearchRoute.$parentNavigatorKey,
      factory: $SearchRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/search/:input',
          factory: $SearchFoundRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/search',
          factory: $SearchRecommendRouteExtension._fromState,
        ),
      ],
    );

extension $SearchRouteExtension on SearchRoute {
  static SearchRoute _fromState(GoRouterState state) => const SearchRoute();
}

extension $SearchFoundRouteExtension on SearchFoundRoute {
  static SearchFoundRoute _fromState(GoRouterState state) => SearchFoundRoute(
        input: state.pathParameters['input']!,
      );

  String get location => GoRouteData.$location(
        '/search/${Uri.encodeComponent(input)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SearchRecommendRouteExtension on SearchRecommendRoute {
  static SearchRecommendRoute _fromState(GoRouterState state) =>
      SearchRecommendRoute();

  String get location => GoRouteData.$location(
        '/search',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $productRoute => GoRouteData.$route(
      path: '/product/:productId',
      parentNavigatorKey: ProductRoute.$parentNavigatorKey,
      factory: $ProductRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'menu',
          parentNavigatorKey: CategoriesRoute.$parentNavigatorKey,
          factory: $CategoriesRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'book',
          parentNavigatorKey: BookRoute.$parentNavigatorKey,
          factory: $BookRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'billing',
          parentNavigatorKey: BillingRoute.$parentNavigatorKey,
          factory: $BillingRouteExtension._fromState,
        ),
      ],
    );

extension $ProductRouteExtension on ProductRoute {
  static ProductRoute _fromState(GoRouterState state) => ProductRoute(
        productId: state.pathParameters['productId']!,
      );

  String get location => GoRouteData.$location(
        '/product/${Uri.encodeComponent(productId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CategoriesRouteExtension on CategoriesRoute {
  static CategoriesRoute _fromState(GoRouterState state) => CategoriesRoute(
        productId: state.pathParameters['productId']!,
      );

  String get location => GoRouteData.$location(
        '/product/${Uri.encodeComponent(productId)}/menu',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BookRouteExtension on BookRoute {
  static BookRoute _fromState(GoRouterState state) => BookRoute(
        productId: state.pathParameters['productId']!,
      );

  String get location => GoRouteData.$location(
        '/product/${Uri.encodeComponent(productId)}/book',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BillingRouteExtension on BillingRoute {
  static BillingRoute _fromState(GoRouterState state) => BillingRoute(
        productId: state.pathParameters['productId']!,
      );

  String get location => GoRouteData.$location(
        '/product/${Uri.encodeComponent(productId)}/billing',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $billingSettingsRoute => GoRouteData.$route(
      path: '/settings/billing',
      parentNavigatorKey: BillingSettingsRoute.$parentNavigatorKey,
      factory: $BillingSettingsRouteExtension._fromState,
    );

extension $BillingSettingsRouteExtension on BillingSettingsRoute {
  static BillingSettingsRoute _fromState(GoRouterState state) =>
      const BillingSettingsRoute();

  String get location => GoRouteData.$location(
        '/settings/billing',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
