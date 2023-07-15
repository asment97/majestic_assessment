import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/providers/app_provider.dart';
import 'package:majestic_assessment/core/providers/auth_provider.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscure = useState(true);
    final authNotifier = ref.watch(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 50.0,
          ),
          child: Form(
            key: authNotifier.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Majestic Assessment",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 80),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Username",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Required username";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    authNotifier.username = value;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        iconSize: 20,
                        onPressed: () {
                          isObscure.value = !isObscure.value;
                        },
                        icon: isObscure.value
                            ? const Icon(
                                Icons.visibility_outlined,
                                size: 24,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                size: 24,
                              ),
                      ),
                    ),
                  ),
                  obscureText: isObscure.value,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Required password";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    authNotifier.password = value;
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async {
                    if (authNotifier.formKey.currentState!.validate()) {
                      await authNotifier.login().then((value) {
                        if (value) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.home, (route) => false);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Something went wrong, please try again!"),
                            ),
                          );
                        }
                      });
                    }
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
