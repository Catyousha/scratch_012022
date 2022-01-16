import 'package:flutter/material.dart';
import 'package:scratch_012022/pages/dashboard.dart';
import 'package:scratch_012022/pages/home.dart';
import 'package:scratch_012022/pages/home/detail.dart';
import 'package:scratch_012022/pages/profile.dart';
import 'package:scratch_012022/pages/settings.dart';

class Routes {
  static const dashboard = 'dashboard';
}

class SubRoutes {
  static final key = GlobalKey<NavigatorState>();
  static const home = 'home';
  static const profile = 'profile';
  static const settings = 'settings';
}

class HomeSubRoutes {
  static const detail = 'detail';
}

class RouteHandler {
  static const initial = Routes.dashboard;
  static Widget emptyPage() {
    return const Scaffold(
      body: Center(
        child: Text('404 Not Found'),
      ),
    );
  }

  static Route<dynamic> generateMainRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardPage(),
          settings: const RouteSettings(
            name: Routes.dashboard,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => emptyPage(),
        );
    }
  }

  static Route<dynamic> generateSubRoute(RouteSettings settings) {
    switch (settings.name) {
      case SubRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: const RouteSettings(
            name: SubRoutes.home,
          ),
        );
      case HomeSubRoutes.detail:
        return MaterialPageRoute(
          builder: (_) => const DetailSubpage(),
          settings: const RouteSettings(
            name: SubRoutes.home,
            arguments: <String, bool>{
              'disable-bot-nav': true,
            },
          ),
        );
      case SubRoutes.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
          settings: const RouteSettings(
            name: SubRoutes.profile,
          ),
        );
      case SubRoutes.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
          settings: const RouteSettings(
            name: SubRoutes.settings,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => emptyPage(),
        );
    }
  }
}
