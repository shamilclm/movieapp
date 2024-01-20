import 'package:movieapp/features2/data/repository/movie_repository_impl.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/domain/repository/movie_repository.dart';
import 'package:movieapp/features2/domain/usecase/movie_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_provider.g.dart';

@riverpod
class Movie extends _$Movie {
  late final MovieRepository repository;
  @override
  Future<List<MovieEntity>> build() {
    return MovieUsecase(repository: ref.watch(movierepositoryProvider))();
  }
}
