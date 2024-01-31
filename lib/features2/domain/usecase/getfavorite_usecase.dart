import 'package:movieapp/core/exeption/auth/base_exeption.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/domain/repository/firebase_repository.dart';

final class GetmoviesUsecase {
  final FirebaseRepository repository;

  GetmoviesUsecase({required this.repository});

  Stream<List<MovieEntity>> call() {
    try {
      return repository.getfavoriteMovies();
    } catch (e) {
      throw Baseexeption(e.toString());
    }
  }
}
