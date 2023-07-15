import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = ChangeNotifierProvider.autoDispose<CounterProvider>(
  (ref) => CounterProvider(ref),
);

class CounterProvider extends ChangeNotifier {
  final Ref ref;
  CounterProvider(this.ref);

  int count = 0;
  TextEditingController controller = TextEditingController(text: "1");

  void addCount() {
    count = count + int.parse(controller.text);
    notifyListeners();
  }

  void minusCount() {
    count = count - int.parse(controller.text);
    notifyListeners();
  }
}
