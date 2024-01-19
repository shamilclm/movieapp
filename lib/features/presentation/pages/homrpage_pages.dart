import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/features/presentation/pages/login_pages.dart';
import 'package:movieapp/features/presentation/providers/signup_provider.dart';

class MyWidget extends ConsumerWidget {
  static const routepath = '/';
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                ref.read(authenticationProvider(context).notifier).signout();

                context.go(MyLogin.routepath);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(),
    );
  }
}
