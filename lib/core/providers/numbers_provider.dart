import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final numbersProvider = ChangeNotifierProvider.autoDispose<NumbersProvider>(
  (ref) => NumbersProvider(ref),
);

class NumbersProvider extends ChangeNotifier {
  final Ref ref;
  NumbersProvider(this.ref);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? list;
  int? largest;
  int? secLarge;
  int? smallest;

  void calc() {
    if (list != null && list!.isNotEmpty) {
      largest = null;
      secLarge = null;
      smallest = null;

      List<int> numbers =
          list!.split(",").map((e) => e.isNotEmpty ? int.parse(e) : 0).toList();
      if (numbers.length >= 2) {
        for (int i = 0; i < numbers.length - 1; i++) {
          if (numbers[i] > numbers[i + 1]) {
            if (largest == null && secLarge == null) {
              largest = numbers[i];
              secLarge = numbers[i + 1];
            }
            // get largest
            else if (numbers[i] > largest!) {
              secLarge = largest;
              largest = numbers[i];
            }
            // get smallest
            if (smallest == null) {
              smallest = numbers[i + 1];
            } else if (numbers[i + 1] < smallest!) {
              smallest = numbers[i + 1];
            }
          } else {
            if (largest == null && secLarge == null) {
              largest = numbers[i + 1];
              secLarge = numbers[i];
            }
            // get largest
            else if (numbers[i + 1] > largest!) {
              secLarge = largest;
              largest = numbers[i + 1];
            }
            // get smallest
            if (smallest == null) {
              smallest = numbers[i];
            } else if (numbers[i] < smallest!) {
              smallest = numbers[i];
            }
          }
        }
      }
    }
    notifyListeners();
  }
}
