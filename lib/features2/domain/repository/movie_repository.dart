import 'package:movieapp/features2/domain/entity/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();
  Future<List<MovieEntity>> trndingMovie();
}
