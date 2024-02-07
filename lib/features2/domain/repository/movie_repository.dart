import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/domain/entity/trailer_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();
  Future<List<MovieEntity>> trndingMovie();
  Future<List<MovieEntity>> searchMovies(String text);
  Future<List<Trailerentity>> addTrailer(String id);
}
