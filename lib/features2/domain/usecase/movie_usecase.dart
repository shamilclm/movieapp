import 'package:movieapp/core/exeption/auth/movie_exeption.dart';
import 'package:movieapp/core/utils/network_utils.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/domain/repository/movie_repository.dart';
import 'package:movieapp/features2/domain/repository/objectbox_repository.dart';

final class MovieUsecase {
  final MovieRepository repository;
  final ObjectboxRepository objectrepository;

  MovieUsecase({required this.repository, required this.objectrepository});

  Future<List<MovieEntity>> call() async {
    try {
      if (await NetworkUtils.hasNetwork()) {
        final data = await repository.getMovies();
        objectrepository.clearAll();
        objectrepository.addMovies(data);
        return data;
      } else {
        final localdata = objectrepository.getMovies();
        return localdata;
      }
    } catch (e) {
      throw MoviesExeption(e.toString());
    }
  }
}
