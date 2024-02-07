import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/features2/presentation/providers/movie_provider.dart';

class Bottommavigation extends ConsumerWidget {
  final PageController pageController;
  const Bottommavigation({super.key, required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CurvedNavigationBar(
        backgroundColor: Colors.black,
        color: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        index: ref.watch(selected),
        onTap: (value) {
          pageController.jumpToPage(value);
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.black,
          ),
          Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          Icon(
            Icons.search,
            color: Colors.black,
          ),
        ]);
  }
}
