import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/core/constants/login_constansts.dart';
import 'package:movieapp/features/presentation/providers/signup_provider.dart';

class Forgetbutton extends ConsumerWidget {
  final TextEditingController controller;
  const Forgetbutton({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
        onPressed: () {
          ref
              .read(authenticationProvider(context).notifier)
              .passwordReset(controller.text);
        },
        child: const Text(Logintext.bname));
  }
}
