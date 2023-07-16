import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/providers/palindrome_provider.dart';

class PalindromePage extends ConsumerWidget {
  const PalindromePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palindrome = ref.watch(palindromeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Palindrome"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 100),
              TextField(
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    palindrome.validate(value);
                  }
                },
              ),
              const SizedBox(height: 30),
              if (palindrome.isPalindrome != null)
                Text(
                  palindrome.isPalindrome ?? "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
