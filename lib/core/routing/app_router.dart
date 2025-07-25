import 'package:flutter/material.dart';
import '../../features/login/ui/login.dart';
import '../../features/on_boarding/ui/on_boarding.dart';
import '../../features/splash/splash.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const Splash());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoarding());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => Login());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
