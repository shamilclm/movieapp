import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/presentation/pages/overview_page.dart';

class Caroslerslider extends ConsumerWidget {
  final images = 'https://image.tmdb.org/t/p/w500';
  final List<MovieEntity> list;
  final int itemCount;

  const Caroslerslider(
      {super.key, required this.list, required this.itemCount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 300,
      child: CarouselSlider.builder(
          itemCount: itemCount,
          itemBuilder: (context, index, realIndex) {
            final posterpathFile = File(list[index].posterPath);
            late final ImageProvider image;
            if (posterpathFile.existsSync()) {
              image = FileImage(posterpathFile);
            } else {
              image = NetworkImage(images + list[index].posterPath);
            }

            return InkWell(
              onTap: () => context.push(Viewpage.routepath, extra: list[index]),
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(image: image)),
              ),
            );
          },
          options: CarouselOptions(
            aspectRatio: 10.0,
            height: 300,
            viewportFraction: 0.50,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.linear,
            enlargeCenterPage: true,
          )),
    );
  }
}
