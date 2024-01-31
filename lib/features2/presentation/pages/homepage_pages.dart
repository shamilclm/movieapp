import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/movie_constants.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features/presentation/pages/login_pages.dart';
import 'package:movieapp/features/presentation/providers/signup_provider.dart';
import 'package:movieapp/features2/presentation/pages/favoritepage_pages.dart';
import 'package:movieapp/features2/presentation/providers/movie_provider.dart';
import 'package:movieapp/features2/presentation/widgets/bottonnavigation_widget.dart';
import 'package:movieapp/features2/presentation/widgets/caroslerslider_widget.dart';
import 'package:movieapp/features2/presentation/widgets/gridviewbuilder_widgets.dart';
import 'package:movieapp/features2/presentation/widgets/listviewbuilder_widget.dart';
import 'package:movieapp/features2/presentation/widgets/text_widgets.dart';
import 'package:movieapp/features2/presentation/widgets/upcomig_widget.dart';

class Homepage extends ConsumerWidget {
  final image = 'https://image.tmdb.org/t/p/w500';
  static const routepath = '/';
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.text,
      // appBar: const PreferredSize(
      //     preferredSize: Size.fromHeight(60), child: AppbarWidget()),
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
                ref.read(authenticationProvider.notifier).signout(context);

                context.go(MyLogin.routepath);
              },
              icon: Icon(
                Icons.logout,
                color: AppTheme.of(context).colors.textInverse,
              )),
        ],
      ),
      body: ref.watch(movieProvider).isRefreshing
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : switch (ref.watch(movieProvider)) {
              AsyncData(:final value) => PageView(
                  controller: ref.read(movieProvider.notifier).pageController,
                  onPageChanged: (value) {
                    ref.read(selected.notifier).state = value;
                  },
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Caroslerslider(
                            itemCount: value.movies.length,
                            list: value.movies,
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
                              child: GridviewList(
                                  itemCount: value.trending.length,
                                  list: value.trending)),
                          SizedBox(
                            height: AppTheme.of(context).spaces.space_125,
                          ),
                          const Upcomigsub(),
                          SizedBox(
                            height: AppTheme.of(context).spaces.space_125,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 150,
                            child: ListviewWidget(
                              itemCount: value.movies.length,
                              list: value.movies,
                            ),
                          )
                        ],
                      ),
                    ),
                    Favoritepage(),
                  ],
                ),
              AsyncError(:final error) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        error.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            ref.invalidate(movieProvider);
                          },
                          child: Text("Retry"))
                    ],
                  ),
                ),
              _ => const Center(
                  child: CircularProgressIndicator(),
                ),
            },
      bottomNavigationBar: const Bottommavigation(),
    );
  }
}
