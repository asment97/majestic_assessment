import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final factorialProvider = ChangeNotifierProvider.autoDispose<FactorialProvider>(
  (ref) => FactorialProvider(ref),
);

class FactorialProvider extends ChangeNotifier {
  final Ref ref;
  FactorialProvider(this.ref);

  int finalResult = 0;

  void calc(int number) {
    int result = 0;
    for (int i = 1; i <= number; i++) {
      if (i == 1) {
        result = i;
      } else {
        result *= i;
      }
    }
    finalResult = result;
    notifyListeners();
  }
}
