import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/core/constants/login_constansts.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features/presentation/providers/signup_provider.dart';

class Button extends ConsumerWidget {
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;
  const Button({super.key,required this.emailcontroller,required this.passwordcontroller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      
   
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(100, 40),
            backgroundColor: AppTheme.of(context).colors.textSubtle),
        onPressed: () {
          
          ref
              .read(authenticationProvider(context).notifier)
              .signUpWithEmail(emailcontroller.text, passwordcontroller.text);
              
        },
        child: Text(
          Signup.sitextbutton,
          style: TextStyle(color: AppTheme.of(context).colors.textInverse),
        ));
  }
}
