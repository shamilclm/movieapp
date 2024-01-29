import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/movie_constants.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features/presentation/pages/login_pages.dart';
import 'package:movieapp/features/presentation/providers/signup_provider.dart';

class AppbarWidget extends ConsumerWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: AppTheme.of(context).colors.text,
      title: Text(
        Movies.title,
        style: AppTheme.of(context)
            .typography
            .h700
            .copyWith(color: AppTheme.of(context).colors.textInverse),
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: AppTheme.of(context).colors.textInverse,
          )),
      actions: [
        IconButton(
            onPressed: () {
              ref.read(authenticationProvider(context).notifier).signout();

              context.go(MyLogin.routepath);
            },
            icon: Icon(
              Icons.logout,
              color: AppTheme.of(context).colors.textInverse,
            )),
      ],
    );
  }
}
