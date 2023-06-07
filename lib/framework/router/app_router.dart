

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../page/create/create_page.dart';
import '../../page/delete/delete_page.dart';
import '../../page/list/list_page.dart';
import '../../page/on_boarding/on_boarding_page.dart';
import '../../page/splash/splash_page.dart';
import '../../page/update/update_page.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: OnBoardingRoute.page, path: '/on_boarding'),
    AutoRoute(page: ListRoute.page, path: '/list'),
    AutoRoute(page: CreateRoute.page, path: '/create'),
    AutoRoute(page: UpdateRoute.page, path: '/update'),
    AutoRoute(page: DeleteRoute.page, path: '/delete')
  ];
}
