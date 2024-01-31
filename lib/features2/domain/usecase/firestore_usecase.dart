import 'package:movieapp/core/exeption/auth/base_exeption.dart';
import 'package:movieapp/features2/domain/entity/movie_entity.dart';
import 'package:movieapp/features2/domain/repository/firebase_repository.dart';

final class FirestoreUsecase {
  final FirebaseRepository repository;

  FirestoreUsecase({required this.repository});

  Future<void> call(MovieEntity entity) async {
    try {
      return await repository.addtofirestore(entity);
    } catch (e) {
      throw Baseexeption(e.toString());
    }
  }
}
