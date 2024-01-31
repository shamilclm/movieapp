import 'package:movieapp/core/exeption/auth/base_exeption.dart';
import 'package:movieapp/features2/domain/repository/firebase_repository.dart';

final class DeleteFirestoreUsecase {
  final FirebaseRepository repository;

  DeleteFirestoreUsecase({required this.repository});

  Future<void> call(int id) async {
    try {
      return await repository.deleteFromFirestore(id);
    } catch (e) {
      throw Baseexeption(e.toString());
    }
  }
}
