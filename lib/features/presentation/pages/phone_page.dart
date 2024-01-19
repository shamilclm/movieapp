import 'package:flutter/material.dart';

class Myphone extends StatelessWidget {
  static const routepath = '/phone';
  const Myphone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 55, top: 40),
            child: Container(
              width: 300,
              height: 170,
              child: Image.asset(
                'assets/images/movielogo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
