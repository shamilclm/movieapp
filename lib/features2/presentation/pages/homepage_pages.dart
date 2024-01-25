import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/movie_constants.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features/presentation/pages/login_pages.dart';
import 'package:movieapp/features/presentation/providers/signup_provider.dart';
import 'package:movieapp/features2/presentation/providers/movie_provider.dart';
import 'package:movieapp/features2/presentation/widgets/caroslerslider_widget.dart';
import 'package:movieapp/features2/presentation/widgets/gridviewbuilder_widgets.dart';
import 'package:movieapp/features2/presentation/widgets/text_widgets.dart';

class Homepage extends ConsumerWidget {
  final image = 'https://image.tmdb.org/t/p/w500';
  static const routepath = '/';
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: AppTheme.of(context).colors.text,
        appBar: AppBar(
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
                ))
          ],
        ),
        body: switch (ref.watch(movieProvider)) {
          AsyncData(:final value) => Column(
              children: [
                Caroslerslider(
                  itemCount: value.length,
                  list: value,
                ),
                SizedBox(
                  height: AppTheme.of(context).spaces.space_125,
                ),
                const Textsub(),
                SizedBox(
                  height: AppTheme.of(context).spaces.space_125,
                ),
                Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 400,
                    child: GridviewList(itemCount: value.length, list: value))
              ],
            ),
          AsyncError(:final error) => Center(
              child: Text(error.toString()),
            ),
          _ => const Center(
              child: CircularProgressIndicator(),
            ),
        });
  }
}
