import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/core/constants/login_constansts.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features/presentation/providers/signup_provider.dart';

class Mybutton extends ConsumerWidget {
  final TextEditingController emailcontroler;
  final TextEditingController passwordcontroler;
  Mybutton(
      {super.key,
      required this.emailcontroler,
      required this.passwordcontroler});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 40),
            backgroundColor: AppTheme.of(context).colors.backgroundDanger),
        onPressed: () {
          ref
              .read(authenticationProvider(context).notifier)
              .signinWithEmail(emailcontroler.text, passwordcontroler.text);
        },
        child: Text(
          Login.lbtn,
          style: TextStyle(color: AppTheme.of(context).colors.textInverse),
        ));
  }
}
