import 'package:flutter/material.dart';
import 'package:majestic_assessment/screens/auth/login.dart';
import 'package:majestic_assessment/screens/camera/camera.dart';
import 'package:majestic_assessment/screens/counter/counter.dart';
import 'package:majestic_assessment/screens/home/home.dart';
import 'package:majestic_assessment/screens/initial/initial.dart';
import 'package:majestic_assessment/screens/posts/posts_page.dart';

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
  Routes.posts: (Object params) => MaterialPageRoute(
        settings: const RouteSettings(name: Routes.posts),
        builder: (context) => const PostsPage(),
      ),
  Routes.counter: (Object params) => MaterialPageRoute(
        settings: const RouteSettings(name: Routes.counter),
        builder: (context) => const CounterPage(),
      ),
  Routes.camera: (Object params) => MaterialPageRoute(
        settings: const RouteSettings(name: Routes.camera),
        builder: (context) => const CameraPage(),
      ),
};

class Routes {
  Routes._();

  static const root = '/';
  static const login = '/login';
  static const home = '/home';
  static const posts = '/posts';
  static const counter = '/counter';
  static const camera = '/camera';
}
