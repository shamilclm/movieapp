
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movieapp/core/exeption/auth/invalid_exeption.dart';
import 'package:movieapp/core/exeption/auth/signin_exeption.dart';
import 'package:movieapp/features/domain/repository/auth_repository.dart';

final class Signinusecase {
  final Authrepository repository;
  Signinusecase({required this.repository});
  Future<void> call(String email, String password) async {
    if (email.trim().isEmpty|| password.trim().isEmpty){
      throw InvalidFailedExeption();
    }
    try {
       await repository.signinwithemail(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SigninExeption(e.message ?? "Sign up failed please retry", e.code);
    }
  }
}
