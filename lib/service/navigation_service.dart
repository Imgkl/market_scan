import 'package:flutter/widgets.dart';

class NavigationService {
  NavigationService._();

  static final NavigationService _instance = NavigationService._();

  static NavigationService get instance => _instance;

  final navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> getNavigatorKey() => navigatorKey;

  NavigatorState get navigator => navigatorKey.currentState!;

  BuildContext get context => navigatorKey.currentContext!;

  Future<T?> pushNamed<T>(String routeName, {Object? args}) {
    return navigator.pushNamed<T>(routeName, arguments: args);
  }

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    Object? args,
  }) {
    return navigator.popAndPushNamed<T, TO>(routeName, arguments: args);
  }

  void pop<T extends Object?>({int? popCount, T? result}) {
    navigator.pop<T>(result);
  }
}
