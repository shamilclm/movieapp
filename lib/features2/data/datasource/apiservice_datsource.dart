import 'package:movieapp/features2/data/models/movie_model.dart';

abstract class ApiServiceDataSourse {
  Future<MovieModel> getMovies();
}