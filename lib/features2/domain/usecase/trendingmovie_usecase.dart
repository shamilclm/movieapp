import 'package:movieapp/core/exeption/auth/movie_exeption.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/domain/repository/movie_repository.dart';

final class TrendingMovieUsecase {
  final MovieRepository repository;

  TrendingMovieUsecase({required this.repository});

  Future<List<MovieEntity>> call() async {
    try {
      return await repository.trndingMovie();
    } catch (e) {
      throw MoviesExeption("Error while fetching");
    }
  }
}
