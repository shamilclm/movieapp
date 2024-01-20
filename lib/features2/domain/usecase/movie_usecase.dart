import 'package:movieapp/core/exeption/auth/movie_exeption.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/domain/repository/movie_repository.dart';

final class MovieUsecase {
  final MovieRepository repository;

  MovieUsecase({required this.repository});

  Future<List<MovieEntity>> call() async {
    try {
      return await repository.getMovies();
    } catch (e) {
      throw MoviesExeption("Error while fetching");
    }
  }
}
