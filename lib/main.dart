import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_panda/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_panda/blocs/search_bloc/search_bloc.dart';
import 'package:food_panda/repositories/auth_repo.dart';
import 'package:food_panda/repositories/search_repo.dart';
import 'package:food_panda/repositories/user_repo.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/theme/theme.dart';

import 'package:flutter_web_plugins/url_strategy.dart';

import 'network/base_api.dart';

Future<void> main() async {
  await startDio();
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
  late final SearchRepo _searchRepo;

  @override
  void initState() {
    super.initState();
    _authRepo = AuthRepo();
    _userRepo = UserRepo();
    _searchRepo = SearchRepo();
  }

  @override
  void dispose() {
    _authRepo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authRepo),
        RepositoryProvider.value(value: _searchRepo)
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(authRepo: _authRepo, userRepo: _userRepo),
          ),
          BlocProvider(
            create: (_) => SearchBloc(searchRepo: _searchRepo),
          )
        ],
        child: MaterialApp.router(
          theme: appTheme,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
