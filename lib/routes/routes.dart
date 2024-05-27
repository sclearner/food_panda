part of 'router.dart';

typedef NavigatorKey = GlobalKey<NavigatorState>;

final NavigatorKey rootNavigatorKey = GlobalKey(debugLabel: "Root Navigator");
final NavigatorKey mainNavigatorKey = GlobalKey(debugLabel: "Main Navigator");

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  static final NavigatorKey $navigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }

}

@TypedShellRoute<MainRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(path: '/'),
    TypedGoRoute<HistoryRoute>(path: '/history'),
    TypedGoRoute<FavoritesRoute>(path: '/favorite'),
    TypedGoRoute<NotificationsRoute>(path: '/notifications'),
    TypedGoRoute<SettingsRoute>(path: '/settings')
  ]
)
class MainRoute extends ShellRouteData {
  static final NavigatorKey $navigatorKey = mainNavigatorKey;
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MainScreen(child: navigator);
  }
}

class HomeRoute extends GoRouteData with LoginRedirect {
  static final NavigatorKey $navigatorKey = mainNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreen();
  }
}

class HistoryRoute extends GoRouteData with LoginRedirect {
  static final NavigatorKey $navigatorKey = mainNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO: implement build
    return HistoryScreen();
  }
}

class FavoritesRoute extends GoRouteData with LoginRedirect {
  static final NavigatorKey $navigatorKey = mainNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FavoritesScreen();
  }
}

class NotificationsRoute extends GoRouteData with LoginRedirect {
  static final NavigatorKey $navigatorKey = mainNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NotificationScreen();
  }
}

class SettingsRoute extends GoRouteData with LoginRedirect {
  static final NavigatorKey $navigatorKey = mainNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingsScreen();
  }
}

@TypedGoRoute<SearchRoute>(path: '/search/:input')
class SearchRoute extends GoRouteData with LoginRedirect {
  const SearchRoute({required this.input});
  static final NavigatorKey $navigatorKey = rootNavigatorKey;
  final String input;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchScreen();
  }
}

@TypedGoRoute<ProductRoute>(path: '/product/:productId', routes: [
  TypedGoRoute<CategoriesRoute>(path: 'menu'),
  TypedGoRoute<BookRoute>(path: 'book'),
  TypedGoRoute<BillingRoute>(path: 'billing')
])
class ProductRoute extends GoRouteData with LoginRedirect {
  const ProductRoute({required this.productId});

  final String productId;

  static final NavigatorKey $navigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProductScreen();
  }
}

class BookRoute extends GoRouteData with LoginRedirect {
  static final NavigatorKey $navigatorKey = rootNavigatorKey;

  final String productId;

  const BookRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BookScreen();
  }
}

class CategoriesRoute extends GoRouteData with LoginRedirect {
  const CategoriesRoute({required this.productId});

  final String productId;
  static final NavigatorKey $navigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CategoriesScreen();
  }
}

class BillingRoute extends GoRouteData with LoginRedirect {
  const BillingRoute({required this.productId});

  final String productId;
  static final NavigatorKey $navigatorKey = rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BillingScreen();
  }
}

mixin LoginRedirect on GoRouteData {
  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final authState = context.read<AuthBloc>().state;
    if (authState.status == AuthStatus.auth) {
      return '/login';
    }
    return null;
  }
}