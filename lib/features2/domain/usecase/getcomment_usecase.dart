import 'package:movieapp/core/exeption/auth/base_exeption.dart';
import 'package:movieapp/features2/domain/entity/comment_entity.dart';
import 'package:movieapp/features2/domain/repository/firebase_repository.dart';

class GetcommentUsecase {
  final FirebaseRepository repository;
  GetcommentUsecase({required this.repository});
  Stream<List<CommentEntity>> call(String id) {
    try {
      return repository.getComment(id);
    } catch (e) {
      throw Baseexeption(e.toString());
    }
  }
}
