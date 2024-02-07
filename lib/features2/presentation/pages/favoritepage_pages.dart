import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features2/presentation/providers/movie_provider.dart';
import 'package:movieapp/features2/presentation/widgets/favoritepage_widget.dart';

class Favoritepage extends ConsumerWidget {
  const Favoritepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.text,
      body: StreamBuilder(
        stream: ref.read(movieProvider.notifier).getMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Gridviewfavorite(list: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
