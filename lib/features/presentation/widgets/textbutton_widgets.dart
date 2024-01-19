import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/login_constansts.dart';

class Textbutton extends StatelessWidget {
  const Textbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.go('/signup');
        },
        child: const Text(
          Login.ltextbutton,
        ));
  }
}
