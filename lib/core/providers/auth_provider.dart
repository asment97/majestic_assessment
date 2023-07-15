import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/providers/app_provider.dart';
import 'package:majestic_assessment/core/providers/navigator_provider.dart';

final authProvider = StateNotifierProvider<AuthProvider, String?>(
  (ref) => AuthProvider(ref),
);

class AuthProvider extends StateNotifier<String?> {
  final Ref ref;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  AuthProvider(this.ref) : super(null) {
    _init();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";

  Future _init() async {
    state = await storage.read(key: "username");

    if (state != null) {
      ref.read(navigatorProvider).navigateToAndRemoveUntil(Routes.home);
    } else {
      ref.read(navigatorProvider).navigateToAndRemoveUntil(Routes.login);
    }
  }

  Future<bool> login() async {
    if (username.isNotEmpty && password.isNotEmpty) {
      await storage.write(key: "username", value: username);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await storage.delete(key: "username");
    state = null;
    ref.read(navigatorProvider).navigateToAndRemoveUntil(Routes.login);
  }
}
