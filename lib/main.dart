import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_panda/repositories/auth_repo.dart';
import 'package:food_panda/repositories/user_repo.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/theme/theme.dart';

import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:food_panda/ui/splash/splash_page.dart';

void main() {
  usePathUrlStrategy();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthRepo _authRepo;
  late final UserRepo _userRepo;

  @override
  void initState() {
    super.initState();
    _authRepo = AuthRepo();
    _userRepo = UserRepo();
  }

  @override
  void dispose() {
    _authRepo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepo,
      child: BlocProvider(
        create: (_) => AuthBloc(authRepo: _authRepo, userRepo: _userRepo),
        child: MaterialApp.router(
          theme: appTheme,
          routerConfig: router,
        ),
      ),
    );
  }
}
