import 'package:movieapp/core/exeption/auth/base_exeption.dart';
import 'package:movieapp/core/exeption/auth/invalid_exeption.dart';
import 'package:movieapp/features2/domain/entity/comment_entity.dart';
import 'package:movieapp/features2/domain/repository/firebase_repository.dart';

final class CommentUsecase {
  final FirebaseRepository repository;

  CommentUsecase({required this.repository});

  Future<void> call(CommentEntity entity, String id) {
    if (entity.comment.trim().isEmpty) {
      throw InvalidFailedExeption();
    }
    try {
      return repository.addComment(entity, id);
    } catch (e) {
      throw Baseexeption(e.toString());
    }
  }
}
