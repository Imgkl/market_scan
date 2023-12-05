import 'package:flutter/material.dart';
import 'package:marketscan/screens/app.dart';
import 'package:marketscan/screens/details.dart';

class Routes {
  static const String app = '/';
  static const String details = '/details';
}

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.app:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const App());
      case Routes.details:
        Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            settings: settings, builder: (_) => Details(data: data));
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
