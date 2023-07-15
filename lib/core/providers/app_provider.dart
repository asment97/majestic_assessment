import 'package:flutter/material.dart';
import 'package:majestic_assessment/screens/home/home.dart';

Map<String, PageRoute<dynamic> Function(Object)> routes = {
  Routes.root: (Object params) => MaterialPageRoute(
        settings: const RouteSettings(name: Routes.root),
        builder: (context) => const HomePage(),
      ),
};

class Routes {
  Routes._();

  static const root = '/';
}
