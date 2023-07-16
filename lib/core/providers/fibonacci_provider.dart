import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fibonacciProvider = ChangeNotifierProvider.autoDispose<FibonacciProvider>(
  (ref) => FibonacciProvider(ref),
);

class FibonacciProvider extends ChangeNotifier {
  final Ref ref;
  FibonacciProvider(this.ref);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int? count;
  int? result;
  Map<int, int> memo = {};

  void calc() {
    if (count != null) {
      result = memoFibonacci(count! - 1);
    }

    notifyListeners();
  }

  int memoFibonacci(int n) {
    if (memo.containsKey(n)) {
      return memo[n]!;
    }
    if (n < 2) {
      return n;
    } else {
      memo[n] = memoFibonacci(n - 1) + memoFibonacci(n - 2);
      return memo[n]!;
    }
  }
}
