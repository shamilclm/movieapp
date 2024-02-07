import 'package:movieapp/features2/domain/entity/comment_entity.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';

abstract class FirebaseRepository {
  Future<void> addtofirestore(MovieEntity entity);
  Future<void> deleteFromFirestore(int id);
  Stream<List<MovieEntity>> getfavoriteMovies();
  Future<void> addComment(CommentEntity entity, String id);
  Stream<List<CommentEntity>> getComment(String id);
  Future<void> delReview(String id);
}
