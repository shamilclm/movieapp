import 'package:movieapp/features2/domain/entity/movie_entity.dart';

abstract class FirebaseRepository {
  Future<void> addtofirestore(MovieEntity entity);
  Future<void> deleteFromFirestore(int id);
  Stream<List<MovieEntity>> getfavoriteMovies();
}
