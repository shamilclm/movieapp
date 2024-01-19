
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movieapp/core/exeption/auth/invalid_exeption.dart';
import 'package:movieapp/core/exeption/auth/signup_exeption.dart';
import 'package:movieapp/features/domain/repository/auth_repository.dart';

final class SignupUsecase {
  final Authrepository repository;
  SignupUsecase({required this.repository});
  Future<void> call(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidFailedExeption();
    }
    try {
      await repository.signupwithemail(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Signupexeption(e.message ?? "signup failed please retry", e.code);
    }
  }
}
