import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/providers/numbers_provider.dart';

class NumbersPage extends ConsumerWidget {
  const NumbersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numbers = ref.watch(numbersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Numbers"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: numbers.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 100),
                const Text(
                  "Please enter list of number separated by comma ( , )",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    value = value?.trim();
                    if (value?.isEmpty ?? true) {
                      return "Please enter some numbers";
                    }

                    if (value?.replaceAll(RegExp(r'[0-9,]'), "").isNotEmpty ??
                        false) {
                      return "Only digits and comma allowed";
                    }
                    if (value!
                            .split(",")
                            .map((e) => e.isNotEmpty ? int.parse(e) : 0)
                            .toList()
                            .length <
                        2) {
                      return "Please enter at least 2 numbers";
                    }
                    numbers.list = value;
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (numbers.formKey.currentState!.validate()) {
                      numbers.calc();
                    }
                  },
                  child: const Text("Submit"),
                ),
                const SizedBox(height: 30),
                if (numbers.largest != null)
                  Text(
                    "Largest Number: ${numbers.largest}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                if (numbers.secLarge != null)
                  Text(
                    "Second-largest Number: ${numbers.secLarge}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                if (numbers.smallest != null)
                  Text(
                    "Smallest Number: ${numbers.smallest}",
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
