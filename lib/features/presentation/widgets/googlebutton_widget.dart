import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/features/presentation/providers/signup_provider.dart';

class Googlebotton extends ConsumerWidget {
  const Googlebotton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(40, 40),
      ),
      onPressed: () {
        ref.read(authenticationProvider.notifier).signInwithGoogle(context);
      },
      child: Image.asset(
        'assets/images/googlelogo.png',
        width: 30,
      ),
    );
  }
}
