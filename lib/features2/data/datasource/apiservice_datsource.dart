import 'package:movieapp/features2/data/models/movie_model.dart';
import 'package:movieapp/features2/data/models/trailer_model.dart';

abstract class ApiServiceDataSourse {
  Future<MovieModel> getMovies();
  Future<MovieModel> trendingMovies();
  Future<MovieModel> searchMovies(String text);
  Future<Movievedios> addTrailer(String id);
}
