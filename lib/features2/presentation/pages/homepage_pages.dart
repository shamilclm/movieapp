import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features/presentation/pages/login_pages.dart';
import 'package:movieapp/features/presentation/providers/signup_provider.dart';
import 'package:movieapp/features2/presentation/providers/movie_provider.dart';

class Homepage extends ConsumerWidget {
  final image = 'https://image.tmdb.org/t/p/w500';
  static const routepath = '/';
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: AppTheme.of(context).colors.text,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  ref.read(authenticationProvider(context).notifier).signout();

                  context.go(MyLogin.routepath);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: switch (ref.watch(movieProvider)) {
          AsyncData(:final value) => Column(
              children: [
                CarouselSlider.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        height: 200,
                        width: 300,
                        child: Image.network(image + value[index].posterPath),
                      );
                    },
                    options: CarouselOptions(
                      aspectRatio: 10.0,
                      height: 300,
                      viewportFraction: 0.50,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.linear,
                      enlargeCenterPage: true,
                    )),
              ],
            ),
          AsyncError(:final error) => Center(
              child: Text(error.toString()),
            ),
          _ => Center(
              child: CircularProgressIndicator(),
            ),
        });
  }
}
