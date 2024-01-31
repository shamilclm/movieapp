import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp/core/widgets/textfield_widgets.dart';
import 'package:movieapp/features/presentation/providers/signup_provider.dart';

class Otp extends HookConsumerWidget {
  static const routepath = '/otp';
  Otp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpcontroller = useTextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Textfield(
                text: "enter otp",
                icon: Icon(Icons.add),
                controller: otpcontroller),
          ),
          ElevatedButton(
              onPressed: () {
                ref
                    .read(authenticationProvider.notifier)
                    .verifyOtp(context, otpcontroller.text);
              },
              child: Text("Verify otp"))
        ],
      ),
    );
  }
}
