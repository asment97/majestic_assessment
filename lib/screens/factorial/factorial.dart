import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/providers/factorial_provider.dart';

class FactorialPage extends ConsumerWidget {
  const FactorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factorial = ref.watch(factorialProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Factorial Number"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 100),
              const Text(
                "Enter number <= 20",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                textAlign: TextAlign.center,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 20),
                onChanged: (value) {
                  if (value.isEmpty) {
                    factorial.calc(0);
                  } else if (int.parse(value) > 20) {
                    factorial.calc(0);
                  } else {
                    factorial.calc(int.parse(value));
                  }
                },
              ),
              const SizedBox(height: 30),
              const Text(
                "Result",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${factorial.finalResult}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
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
