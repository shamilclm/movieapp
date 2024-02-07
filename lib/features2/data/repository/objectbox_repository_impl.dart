import 'package:movieapp/features2/data/datasource/objectbox_datasource.dart';
import 'package:movieapp/features2/data/datasource/objectbox_datasource_impl.dart';
import 'package:movieapp/features2/data/models/objectboxmovie_model.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/domain/repository/objectbox_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'objectbox_repository_impl.g.dart';

class ObjectboxRepositoryImpl implements ObjectboxRepository {
  final ObjectboxDatasource datasource;
  ObjectboxRepositoryImpl({required this.datasource});
  @override
  void addMovies(List<MovieEntity> entityModel) {
    final movieModel = [
      for (final movie in entityModel)
        MovieModelEntity(
            originalTitle: movie.originalTitle,
            movieid: movie.id,
            overview: movie.overview,
            posterPath: movie.posterPath,
            title: movie.title,
            voteAverage: movie.voteAverage,
            backdropPath: movie.backdropPath,
            releaseDate: movie.releaseDate,
            originalLanguage: movie.originalLanguage)
    ];
    datasource.addMovies(movieModel);
  }

  @override
  void clearAll() {
    datasource.clearAll();
  }

  @override
  List<MovieEntity> getMovies() {
    final models = datasource.getMovies();
    return [
      for (final moviemodels in models)
        MovieEntity(
            originalTitle: moviemodels.originalTitle,
            overview: moviemodels.overview,
            posterPath: moviemodels.posterPath,
            title: moviemodels.title,
            id: moviemodels.id,
            voteAverage: moviemodels.voteAverage,
            backdropPath: moviemodels.backdropPath,
            releaseDate: moviemodels.releaseDate,
            originalLanguage: moviemodels.originalLanguage)
    ];
  }
}

@riverpod
ObjectboxRepository objectBoxRepository(ObjectBoxRepositoryRef ref) {
  return ObjectboxRepositoryImpl(
      datasource: ref.watch(objectboxDatasoureceProvider));
}
