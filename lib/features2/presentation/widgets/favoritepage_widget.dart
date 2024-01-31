import 'package:flutter/material.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';

class Gridviewfavorite extends StatelessWidget {
  final image = 'https://image.tmdb.org/t/p/w500';
  final List<MovieEntity> list;
  const Gridviewfavorite({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
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
        );
      },
    );
  }
}
