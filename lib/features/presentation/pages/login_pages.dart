import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp/core/constants/login_constansts.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/core/widgets/textfield_widgets.dart';
import 'package:movieapp/features/presentation/widgets/button_widget.dart';
import 'package:movieapp/features/presentation/widgets/forgetbutton_widget.dart';
import 'package:movieapp/features/presentation/widgets/googlebutton_widget.dart';
import 'package:movieapp/features/presentation/widgets/phonebutton_widget.dart';
import 'package:movieapp/features/presentation/widgets/textbutton_widgets.dart';

class MyLogin extends HookConsumerWidget {
  static const routepath = '/login';

  const MyLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailcontroller = useTextEditingController();
    final passwordcontroler = useTextEditingController();

    // final space = AppTheme.of(context).spaces;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Login.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 40),
                child: SizedBox(
                    width: 400,
                    height: 170,
                    child: Image.network(
                      Login.loginimage,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_900,
              ),
              Textfield(
                text: Login.email,
                icon: Login.icon,
                controller: emailcontroller,
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_250,
              ),
              Textfield(
                text: Login.pass,
                icon: Login.icon1,
                controller: passwordcontroler,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 240),
                  child: Forgetbutton(
                    controller: emailcontroller,
                  )),
              SizedBox(
                height: AppTheme.of(context).spaces.space_400,
              ),
              Mybutton(
                emailcontroler: emailcontroller,
                passwordcontroler: passwordcontroler,
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_100,
              ),
              const Text(Login.text1),
              SizedBox(
                height: AppTheme.of(context).spaces.space_100,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Googlebotton(),
                  Phonebutton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 40,
                    alignment: Alignment.center,
                    child: const Text(
                      Login.login1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Textbutton()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
