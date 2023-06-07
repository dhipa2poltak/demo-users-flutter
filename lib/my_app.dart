
import 'package:flutter/material.dart';

import 'framework/locator/inject_container.dart';
import 'framework/router/app_router.dart';

class MyApp extends StatelessWidget {
  final _appRouter = locator<AppRouter>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildWithTheme(context);
  }

  Widget _buildWithTheme(BuildContext context) {
    return MaterialApp.router(
      title: 'Demo Users',
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
