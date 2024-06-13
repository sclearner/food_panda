part of 'router.dart';

typedef NavigatorKey = GlobalKey<NavigatorState>;

final NavigatorKey rootNavigatorKey = GlobalKey(debugLabel: "Root Navigator");

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with LoginReverseRedirect {
  static final NavigatorKey $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

@TypedStatefulShellRoute<MainRoute>(branches: [
  TypedStatefulShellBranch(routes: [TypedGoRoute<HomeRoute>(path: '/home')]),
  TypedStatefulShellBranch(
      routes: [TypedGoRoute<HistoryRoute>(path: '/history')]),
  TypedStatefulShellBranch(
      routes: [TypedGoRoute<FavoritesRoute>(path: '/favorite')]),
  TypedStatefulShellBranch(
      routes: [TypedGoRoute<NotificationsRoute>(path: '/notifications')]),
  TypedStatefulShellBranch(routes: [
    TypedGoRoute<SettingsRoute>(
      path: '/settings',
    )
  ])
])
class MainRoute extends StatefulShellRouteData {
  static final GlobalKey<MainScreenState> mainScreenKey = GlobalKey();

  const MainRoute();

  static final NavigatorKey $parentNavigatorKey = rootNavigatorKey;
  static final ShellNavigationContainerBuilder $navigatorContainerBuilder =
      (BuildContext context, StatefulNavigationShell navigationShell,
          List<Widget> children) {
    return MainScreen(
        key: mainScreenKey,
        navigationShell: navigationShell,
        children: children);
  };

  @override
  Widget builder(BuildContext context, GoRouterState state,
      StatefulNavigationShell navigationShell) {
    return navigationShell;
  }
}

class HomeRoute extends GoRouteData with LoginRedirect {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class HistoryRoute extends GoRouteData with LoginRedirect {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HistoryScreen();
  }
}

class FavoritesRoute extends GoRouteData with LoginRedirect {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FavoritesScreen();
  }
}

class NotificationsRoute extends GoRouteData with LoginRedirect {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotificationScreen();
  }
}

class SettingsRoute extends GoRouteData with LoginRedirect {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}

@TypedGoRoute<SearchRoute>(path: "/search")
class SearchRoute extends GoRouteData {
  const SearchRoute(this.q);
  final String? q;

  static final NavigatorKey $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchScreen(keyword: q);
  }
}

@TypedGoRoute<ProductRoute>(path: '/product/:productId', routes: [
  TypedGoRoute<CategoriesRoute>(path: 'menu'),
  TypedGoRoute<ReviewRoute>(path: 'review'),
  TypedGoRoute<BookRoute>(path: 'book'),
  TypedGoRoute<BillingRoute>(path: 'billing')
])
class ProductRoute extends GoRouteData with LoginRedirect {
  const ProductRoute({required this.productId, this.$extra});

  final String productId;
  final Menu? $extra;

  static final NavigatorKey $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProductScreen(menu: $extra, productId: productId);
  }
}

class BookRoute extends GoRouteData with LoginRedirect {
  static final NavigatorKey $parentNavigatorKey = rootNavigatorKey;

  final String productId;

  const BookRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BookScreen(productId: productId);
  }
}

class CategoriesRoute extends GoRouteData with LoginRedirect {
  const CategoriesRoute({required this.productId});

  final String productId;
  static final NavigatorKey $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CategoriesScreen();
  }
}

class BillingRoute extends GoRouteData with LoginRedirect {
  const BillingRoute({required this.productId});

  final String productId;
  static final NavigatorKey $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BillingScreen();
  }
}

class ReviewRoute extends GoRouteData with LoginRedirect {
  const ReviewRoute({required this.productId});

  final String productId;
  static final NavigatorKey $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ReviewScreen();
  }
}

@TypedGoRoute<BillingSettingsRoute>(path: '/settings/billing')
class BillingSettingsRoute extends GoRouteData with LoginRedirect {
  const BillingSettingsRoute();

  static final NavigatorKey $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BillingScreen();
  }
}

@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData {
  final String? redirectLink;
  const SplashRoute({this.redirectLink});

  static final NavigatorKey $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SplashScreen(redirectLink: redirectLink);
  }
}

mixin LoginRedirect on GoRouteData {
  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final authState = await _getAuthState(context);
    if (authState.status == AuthStatus.unauth) {
      return '/login';
    }
    return null;
  }
}

mixin LoginReverseRedirect on GoRouteData {
  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final authState = await _getAuthState(context);
    if (authState.status == AuthStatus.auth) {
      return '/';
    }
    return null;
  }
}

Future<AuthState> _getAuthState(BuildContext context) async {
  final authBloc = context.read<AuthBloc>();
  if (authBloc.state.status == AuthStatus.unknown) {
    return await authBloc.stream
        .firstWhere((element) => element.status != AuthStatus.unknown);
  }
  else {
    return authBloc.state;
  }
}

