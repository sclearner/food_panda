import 'package:flutter/material.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/theme/theme.dart';

import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      routerConfig: router,
    );
  }
}
