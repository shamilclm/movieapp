import 'package:firebase_auth/firebase_auth.dart';
import 'package:movieapp/core/exeption/auth/signup_exeption.dart';
import 'package:movieapp/features/domain/repository/auth_repository.dart';

final class GoogleverifyUsecase {
  final Authrepository repository;
  GoogleverifyUsecase({required this.repository});
  Future<void> call() async {
    try {
      await repository.signInwithGoogle();
    } on FirebaseAuthException catch (e) {
      throw Signupexeption('${e.message}', 'try again');
    }
  }
}
