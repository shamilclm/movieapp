import 'package:movieapp/features2/data/datasource/apiservice_datasource_impl.dart';
import 'package:movieapp/features2/data/datasource/apiservice_datsource.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/domain/repository/movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_repository_impl.g.dart';

class MovieRepositoryImpl extends MovieRepository {
  final ApiServiceDataSourse dataSourse;
  MovieRepositoryImpl({required this.dataSourse});

  @override
  Future<List<MovieEntity>> getMovies() async {
    final datas = await dataSourse.getMovies();
    late List<MovieEntity> results;
    results = [
      for (final result in datas.results)
        MovieEntity(
            originalTitle: result.originalTitle,
            overview: result.overview,
            posterPath: result.posterPath,
            releaseDate: result.releaseDate,
            originalLanguage: result.originalLanguage,
            title: result.title,
            backdropPath: result.backdropPath,
            voteAverage: result.voteAverage)
    ];
    return results;
  }
}

@riverpod
MovieRepository movierepository(MovierepositoryRef ref) {
  return MovieRepositoryImpl(dataSourse: (ref.watch(apiDataSourseProvider)));
}
