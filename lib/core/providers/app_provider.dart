import 'package:flutter/material.dart';
import 'package:majestic_assessment/screens/auth/login.dart';
import 'package:majestic_assessment/screens/home/home.dart';
import 'package:majestic_assessment/screens/initial/initial.dart';

Map<String, PageRoute<dynamic> Function(Object)> routes = {
  Routes.root: (Object params) => MaterialPageRoute(
        settings: const RouteSettings(name: Routes.root),
        builder: (context) => const InitialPage(),
      ),
  Routes.login: (Object params) => MaterialPageRoute(
        settings: const RouteSettings(name: Routes.login),
        builder: (context) => const LoginPage(),
      ),
  Routes.home: (Object params) => MaterialPageRoute(
        settings: const RouteSettings(name: Routes.home),
        builder: (context) => const HomePage(),
      ),
};

class Routes {
  Routes._();

  static const root = '/';
  static const login = '/login';
  static const home = '/home';
}
