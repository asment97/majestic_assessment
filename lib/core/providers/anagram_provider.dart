import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final anagramProvider = ChangeNotifierProvider.autoDispose<AnagramProvider>(
  (ref) => AnagramProvider(ref),
);

class AnagramProvider extends ChangeNotifier {
  final Ref ref;
  AnagramProvider(this.ref);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? string1;
  String? string2;
  String? result;

  void identify() {
    result = null;
    if (string1 != null &&
        string1!.isNotEmpty &&
        string2 != null &&
        string2!.isNotEmpty) {
      log(normalize(string1!).toString());
      if (normalize(string1!) == normalize(string2!)) {
        result = "$string1 is an anagram of $string2";
      } else {
        result = "Both $string1 and $string2 are not anagram of each other";
      }
    }

    notifyListeners();
  }

  String normalize(String str) =>
      (str.toLowerCase().split("")..sort()).join("");
}
