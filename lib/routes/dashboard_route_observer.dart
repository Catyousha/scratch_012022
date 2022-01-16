import 'package:flutter/material.dart';
import 'package:scratch_012022/routes/routes.dart';

class DashboardRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  DashboardRouteObserver({
    required this.changeIndex,
    required this.checkBotNavVisible,
  });
  final Function(bool) checkBotNavVisible;
  final Function(int) changeIndex;

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(
      newRoute: newRoute,
      oldRoute: oldRoute,
    );
    switch (newRoute!.settings.name) {
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

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (previousRoute == null) return;
    Map<String, bool>? args = route.settings.arguments as Map<String, bool>?;
    if (args != null) {
      checkBotNavVisible(!(args['disable-bot-nav'] ?? false));
    }
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

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    Map<String, bool>? args =
        previousRoute?.settings.arguments as Map<String, bool>?;
    if (args != null) {
      checkBotNavVisible(!(args['disable-bot-nav'] ?? false));
    } else {
      checkBotNavVisible(true);
    }
  }
}
