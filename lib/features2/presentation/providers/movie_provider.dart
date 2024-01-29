import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp/features2/data/repository/movie_repository_impl.dart';
import 'package:movieapp/features2/domain/repository/movie_repository.dart';
import 'package:movieapp/features2/domain/usecase/movie_usecase.dart';
import 'package:movieapp/features2/domain/usecase/trendingmovie_usecase.dart';
import 'package:movieapp/features2/presentation/providers/state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_provider.g.dart';

@riverpod
class Movie extends _$Movie {
  final PageController pageController = PageController();
  late final MovieRepository repository;
  @override
  Future<Stateprovider> build() async {
    final MovieRepository repository = ref.watch(movierepositoryProvider);
    final result = await Future.wait([
      MovieUsecase(repository: repository)(),
      TrendingMovieUsecase(repository: repository)(),
    ]);
    return Stateprovider(movies: result[0], trending: result[1]);
  }
}

final selected = StateProvider((ref) => 0);
