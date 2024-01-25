import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/presentation/pages/overview_page.dart';

class GridviewList extends StatelessWidget {
  final image = 'https://image.tmdb.org/t/p/w500';
  final List<MovieEntity> list;
  final int itemCount;
  const GridviewList({super.key, required this.itemCount, required this.list});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      padding: EdgeInsets.all(AppTheme.of(context).spaces.space_100),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => context.push(Viewpage.routepath, extra: list[index]),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: NetworkImage(
                      image + list[index].backdropPath,
                    ),
                    fit: BoxFit.cover)),
          ),
        );
      },
    );
  }
}
