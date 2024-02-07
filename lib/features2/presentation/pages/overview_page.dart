import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/theme/app_theme.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/presentation/pages/homepage_pages.dart';
import 'package:movieapp/features2/presentation/providers/movie_provider.dart';
import 'package:movieapp/features2/presentation/widgets/addcomment_button_widget.dart';
import 'package:movieapp/features2/presentation/widgets/overviewElevatedbutton_widget.dart';
import 'package:movieapp/features2/presentation/widgets/trailer_widget.dart';

class Viewpage extends ConsumerWidget {
  final image = 'https://image.tmdb.org/t/p/w500';
  static const routepath = '/view';
  final MovieEntity entity;

  const Viewpage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.text,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 1.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(image + entity.posterPath),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    top: 30,
                    left: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        color: AppTheme.of(context)
                            .colors
                            .textSubtle
                            .withOpacity(.70),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.push(Homepage.routepath);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: AppTheme.of(context).colors.textInverse,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(movieProvider.notifier)
                                    .addToFirestore(entity);
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: AppTheme.of(context).colors.textInverse,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 80,
                    color: AppTheme.of(context).colors.text.withOpacity(.45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          entity.originalTitle,
                          textAlign: TextAlign.center,
                          style: AppTheme.of(context).typography.h700.copyWith(
                              color: AppTheme.of(context).colors.textInverse),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 28,
                    width: 150,
                    color: AppTheme.of(context).colors.textSubtle,
                    child: Text("Relesed Date: ${entity.releaseDate.year}",
                        textAlign: TextAlign.center,
                        style: AppTheme.of(context).typography.h500.copyWith(
                            color: AppTheme.of(context).colors.textInverse)),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 28,
                    width: 40,
                    color: AppTheme.of(context).colors.textSubtle,
                    child: Text(entity.originalLanguage,
                        textAlign: TextAlign.center,
                        style: AppTheme.of(context).typography.h500.copyWith(
                            color: AppTheme.of(context).colors.textInverse)),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 28,
                    width: 60,
                    color: AppTheme.of(context).colors.textSubtle,
                    child: Text("⭐${entity.voteAverage}",
                        textAlign: TextAlign.center,
                        style: AppTheme.of(context).typography.h500.copyWith(
                            color: AppTheme.of(context).colors.textInverse)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_300,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 1.1,
              height: 100,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      entity.overview,
                      style: AppTheme.of(context).typography.h400.copyWith(
                          color: AppTheme.of(context).colors.textInverse),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_300,
            ),
            Container(
              height: 150,
              child: VideoWidget(entity: entity),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_300,
            ),
            Addcomment(
              entity: entity,
            )
          ],
        ),
      ),
    );
  }
}
