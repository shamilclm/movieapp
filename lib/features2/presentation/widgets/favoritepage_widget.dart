import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/presentation/providers/movie_provider.dart';

class Gridviewfavorite extends ConsumerWidget {
  final image = 'https://image.tmdb.org/t/p/w500';
  final List<MovieEntity> list;
  const Gridviewfavorite({super.key, required this.list});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        mainAxisExtent: 200,
      ),
      padding: EdgeInsets.all(AppTheme.of(context).spaces.space_100),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: NetworkImage(
                    image + list[index].posterPath,
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 40,
                  color: Colors.white54,
                  child: IconButton(
                      onPressed: () {
                        ref
                            .read(movieProvider.notifier)
                            .deleteFromFirestore(list[index].id);
                      },
                      icon: Icon(Icons.delete)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
