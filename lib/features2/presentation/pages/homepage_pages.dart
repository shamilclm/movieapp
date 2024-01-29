import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features2/presentation/pages/favoritepage_pages.dart';
import 'package:movieapp/features2/presentation/providers/movie_provider.dart';
import 'package:movieapp/features2/presentation/widgets/bottonnavigation_widget.dart';
import 'package:movieapp/features2/presentation/widgets/caroslerslider_widget.dart';
import 'package:movieapp/features2/presentation/widgets/gridviewbuilder_widgets.dart';
import 'package:movieapp/features2/presentation/widgets/homepage_appbar_widget.dart';
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
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70), child: AppbarWidget()),
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
                      Text(error.toString()),
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
