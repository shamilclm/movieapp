import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp/core/constants/login_constansts.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/core/widgets/signupbutton_widget.dart';
import 'package:movieapp/core/widgets/textbuttons_widgets.dart';
import 'package:movieapp/core/widgets/textfield_widgets.dart';

class Mysignup extends HookConsumerWidget {
  static const routepath = '/signup';

  const Mysignup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailcontroler = useTextEditingController();
    final passwordcontroler = useTextEditingController();
     final namecontroler = useTextEditingController();
      final phonecontroler = useTextEditingController();
    return Scaffold(
        // backgroundColor: AppTheme.of(context).colors.textSubtlest,
        appBar: AppBar(
          title: const Text(Signup.Title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                Signup.hhhh,
                height: 130,
              ),
              Text(
                Signup.signupheading,
                style: AppTheme.of(context).typography.h900,
              ),
              Text(
                Signup.signupsubheading,
                style: AppTheme.of(context).typography.h500,
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_400,
              ),
              Textfield(
                text: Signup.firstname,
                icon: const Icon(Icons.person),
                controller: namecontroler,
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_150,
              ),
              Textfield(
                text: Signup.email,
                icon: Icon(Icons.email),
                controller:emailcontroler,
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_150,
              ),
              Textfield(
                text: Signup.pass,
                icon: Icon(Icons.fingerprint),
                controller: passwordcontroler,
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_150,
              ),
              Textfield(
                text: Signup.phone,
                icon: Icon(Icons.phone),
                controller: phonecontroler,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 40,
                    alignment: Alignment.center,
                    child: const Text(
                      Signup.signup1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const MyTextbutton()
                ],
              ),
              Button(
                  emailcontroller: emailcontroler,
                  passwordcontroller: passwordcontroler)
            ],
          ),
        ));
  }
}
