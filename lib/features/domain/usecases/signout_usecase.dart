import 'package:firebase_auth/firebase_auth.dart';
import 'package:movieapp/core/exeption/auth/signout_exeption.dart';
import 'package:movieapp/features/domain/repository/auth_repository.dart';

final class Signoutusecase {
  final Authrepository repository;
  Signoutusecase({required this.repository});
  Future<void> call() async {
    try {
      await repository.signout();
    } on FirebaseAuthException catch (e) {
      throw SignoutExeption(
          e.message ?? "Sign out failed please retry", e.code);
    }
  }
}
