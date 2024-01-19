import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Phonebutton extends StatelessWidget {
  const Phonebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size(40, 40)),
        onPressed: () {
          context.go('/phone');
        },
        child: Image.asset(
          'assets/images/phonelogo.png',
          width: 30,
        ));
  }
}
