import 'package:movieapp/features2/domain/entity/movie_entity.dart';

abstract class ObjectboxRepository {
  void addMovies(List<MovieEntity> entityModel);
  List<MovieEntity> getMovies();
  void clearAll();
}
