import 'package:dio/dio.dart';
import 'package:movieapp/core/constants/movie_constants.dart';
import 'package:movieapp/core/objectbox/movie_objectbox.dart';
import 'package:movieapp/features2/data/datasource/objectbox_datasource.dart';
import 'package:movieapp/features2/data/models/objectboxmovie_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'objectbox_datasource_impl.g.dart';

class ObjectboxDatasourceImpl implements ObjectboxDatasource {
  final box = MovieObjectBox.instance.movieBox;
  @override
  void addMovies(List<MovieModelEntity> entityModel) async {
    final dio = Dio(BaseOptions(baseUrl: Movies.imagepath));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cached_images';
    for (final movie in entityModel) {
      final posterpathLoction = '$cacheDirectory${movie.posterPath}';
      final backdroppathLocation = '$cacheDirectory${movie.backdropPath}';
      await dio.download(movie.posterPath, posterpathLoction);
      await dio.download(movie.backdropPath, backdroppathLocation);
      movie.posterPath = posterpathLoction;
      movie.backdropPath = backdroppathLocation;
    }
    box.putMany(entityModel);
  }

  @override
  void clearAll() {
    box.removeAll();
  }

  @override
  List<MovieModelEntity> getMovies() {
    return box.getAll();
  }
}

@riverpod
ObjectboxDatasource objectboxDatasourece(ObjectboxDatasoureceRef ref) {
  return ObjectboxDatasourceImpl();
}
