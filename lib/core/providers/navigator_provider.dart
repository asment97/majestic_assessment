import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigatorProvider = StateProvider<NavigatorProvider>((ref) {
  return NavigatorProvider();
});

class NavigatorProvider {
  late GlobalKey<NavigatorState> navigatorKey;

  NavigatorProvider() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateTo(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> replaceWith(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> navigateToAndRemoveUntil(
    String routeName, {
    bool Function(Route<dynamic>)? predicate,
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      predicate ?? (route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> maybePop() {
    return navigatorKey.currentState!.maybePop();
  }
}
