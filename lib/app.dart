import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/providers/app_provider.dart';
import 'package:majestic_assessment/core/providers/navigator_provider.dart';
import 'package:majestic_assessment/core/themes/theme.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(navigatorProvider);

    return MaterialApp(
      builder: (context, child) => child!,
      title: 'Majestic Assessment',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      initialRoute: Routes.root,
      onGenerateRoute: (settings) {
        return routes[settings.name]!(settings.arguments ?? '');
      },
      navigatorKey: navigator.navigatorKey,
    );
  }
}
