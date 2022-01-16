import 'package:flutter/material.dart';
import 'package:scratch_012022/routes/routes.dart';

class DashboardRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  DashboardRouteObserver({
    required this.changeIndex,
  });
  final Function(int) changeIndex;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (previousRoute == null) return;
    if (route.settings.name == previousRoute.settings.name) return;
    switch (route.settings.name) {
      case SubRoutes.home:
        changeIndex(0);
        break;
      case SubRoutes.profile:
        changeIndex(1);
        break;
      case SubRoutes.settings:
        changeIndex(2);
        break;
      default:
        changeIndex(-1);
    }
  }
}
