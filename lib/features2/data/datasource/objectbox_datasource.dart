import 'package:movieapp/features2/data/models/objectboxmovie_model.dart';

abstract class ObjectboxDatasource {
  void addMovies(List<MovieModelEntity> entityModel);
  List<MovieModelEntity> getMovies();
  void clearAll();
}
