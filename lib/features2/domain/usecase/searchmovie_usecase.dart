import 'package:movieapp/core/exeption/auth/movie_exeption.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/domain/repository/movie_repository.dart';

final class SearchMovieUsecase {
  final MovieRepository repository;

  SearchMovieUsecase({required this.repository});

  Future<List<MovieEntity>> call(String text) async {
    try {
      return await repository.searchMovies(text);
    } catch (e) {
      throw MoviesExeption(e.toString());
    }
  }
}
