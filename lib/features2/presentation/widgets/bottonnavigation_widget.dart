import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/features2/presentation/providers/movie_provider.dart';

class Bottommavigation extends ConsumerWidget {
  const Bottommavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 300),
        index: ref.watch(selected),
        onTap: (index) {
          ref.read(movieProvider.notifier).pageController.jumpToPage(index);
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ]);
  }
}
