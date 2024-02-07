import 'package:movieapp/core/exeption/auth/base_exeption.dart';
import 'package:movieapp/features2/domain/repository/firebase_repository.dart';

final class DeleteReviewUseCase {
  final FirebaseRepository repository;
  DeleteReviewUseCase({required this.repository});

  Future<void> call(String id) async {
    try {
      await repository.delReview(id);
    } catch (e) {
      throw Baseexeption(e.toString());
    }
  }
}
