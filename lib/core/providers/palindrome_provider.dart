import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final palindromeProvider =
    ChangeNotifierProvider.autoDispose<PalindromeProvider>(
  (ref) => PalindromeProvider(ref),
);

class PalindromeProvider extends ChangeNotifier {
  final Ref ref;
  PalindromeProvider(this.ref);

  String? isPalindrome;

  void validate(String string) {
    bool palindrome = false;
    bool lowerCasePalindrome = false;

    // convert to lowercase
    final lowerCase = string.toLowerCase();

    if (lowerCase.length.isEven) {
      for (int i = 0; i < lowerCase.length / 2; i++) {
        if (lowerCase[i] != lowerCase[string.length - (i + 1)]) {
          lowerCasePalindrome = false;

          break;
        } else {
          lowerCasePalindrome = true;
        }
      }
    } else {
      for (int i = 0; i < (lowerCase.length / 2) - 1; i++) {
        if (lowerCase[i] != lowerCase[string.length - (i + 1)]) {
          lowerCasePalindrome = false;
          break;
        } else {
          lowerCasePalindrome = true;
        }
      }
    }

    // normal string
    if (string.length.isEven) {
      for (int i = 0; i < string.length / 2; i++) {
        if (string[i] != string[string.length - (i + 1)]) {
          palindrome = false;
          break;
        } else {
          palindrome = true;
        }
      }
    } else {
      for (int i = 0; i < (string.length / 2) - 1; i++) {
        if (string[i] != string[string.length - (i + 1)]) {
          palindrome = false;
          break;
        } else {
          palindrome = true;
        }
      }
    }

    if (palindrome && lowerCasePalindrome) {
      isPalindrome = "$string is a Palindrome String";
    } else if (lowerCasePalindrome && !palindrome) {
      isPalindrome = "$string is a case-insensitive Palindrome String";
    } else {
      isPalindrome = "$string is not a Palindrome String";
    }

    notifyListeners();
  }
}
