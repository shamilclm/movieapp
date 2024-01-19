import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final String? text;
  final Icon? icon;

  final TextEditingController controller;

  const Textfield(
      {super.key,
      required this.text,
      required this.icon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 360,
        height: 70,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: text,
              fillColor: Color.fromARGB(255, 221, 230, 235),
              filled: true,
              prefixIcon: icon,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0))),
        ));
  }
}
