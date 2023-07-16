import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/providers/fibonacci_provider.dart';

class FibonacciPage extends ConsumerWidget {
  const FibonacciPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fibonacci = ref.watch(fibonacciProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fibonacci"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: fibonacci.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 100),
                TextFormField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    value = value?.trim();
                    if (value?.isEmpty ?? true) {
                      return "Please enter a number";
                    }
                    fibonacci.count = int.parse(value!);
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (fibonacci.formKey.currentState!.validate()) {
                      fibonacci.calc();
                    }
                  },
                  child: const Text("Submit"),
                ),
                const SizedBox(height: 30),
                if (fibonacci.result != null)
                  Text(
                    "${fibonacci.count}th Fibonacci number is ${fibonacci.result}",
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
