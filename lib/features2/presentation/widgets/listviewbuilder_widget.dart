import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/presentation/pages/overview_page.dart';

class ListviewWidget extends StatelessWidget {
  const ListviewWidget(
      {super.key, required this.itemCount, required this.list});
  final image = 'https://image.tmdb.org/t/p/w500';
  final List<MovieEntity> list;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Row(
          children: [
            SizedBox(
              width: AppTheme.of(context).spaces.space_200,
            ),
            InkWell(
              onTap: () {
                context.push(Viewpage.routepath, extra: list[index]);
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height / 2,
                width: MediaQuery.sizeOf(context).width / 2.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                          image + list[index].posterPath,
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        );
      },
    );
  }
}
