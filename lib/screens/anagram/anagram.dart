import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/providers/anagram_provider.dart';

class AnagramPage extends ConsumerWidget {
  const AnagramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final anagram = ref.watch(anagramProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Anagram"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: anagram.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 100),
                TextFormField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(hintText: "String 1"),
                  validator: (value) {
                    value = value?.trim();
                    if (value?.isEmpty ?? true) {
                      return "Please enter string 1";
                    }
                    anagram.string1 = value;
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(hintText: "String 2"),
                  validator: (value) {
                    value = value?.trim();
                    if (value?.isEmpty ?? true) {
                      return "Please enter string 2";
                    }
                    anagram.string2 = value;
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (anagram.formKey.currentState!.validate()) {
                      anagram.identify();
                    }
                  },
                  child: const Text("Submit"),
                ),
                const SizedBox(height: 30),
                if (anagram.result != null)
                  Text(
                    anagram.result!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
