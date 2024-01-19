import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/login_constansts.dart';

class MyTextbutton extends StatelessWidget {
  const MyTextbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.go('/login');
        },
        child: const Text(
          Signup.stextbutton,
        ));
  }
}
