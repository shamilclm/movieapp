import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp/core/widgets/textfield_widgets.dart';
import 'package:movieapp/features/presentation/providers/signup_provider.dart';

class Myphone extends HookConsumerWidget {
  static const routepath = '/phone';
  Myphone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phonecontroler = useTextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Textfield(
                text: "enter number",
                icon: Icon(Icons.add),
                controller: phonecontroler),
            ElevatedButton(
                onPressed: () {
                  ref
                      .read(authenticationProvider.notifier)
                      .signInWithPhone(context, phonecontroler.text);
                },
                child: Text("Send otp")),
          ],
        ),
      ),
    );
  }
}
