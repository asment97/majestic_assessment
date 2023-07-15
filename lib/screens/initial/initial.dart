import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/providers/auth_provider.dart';

class InitialPage extends ConsumerWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //check auth credentials
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(authProvider);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Majestic Assessment"),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
