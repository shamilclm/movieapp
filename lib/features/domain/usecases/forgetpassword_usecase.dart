import 'package:movieapp/core/exeption/auth/signup_exeption.dart';
import 'package:movieapp/features/domain/repository/auth_repository.dart';

final class ForgetpasswordUsecase {
  final Authrepository repository;
  ForgetpasswordUsecase({required this.repository});
  Future<void> call(String email) async {
    try {
      await repository.resetPassword(email);
    } on Exception catch (e) {
      throw Signupexeption(e.toString(), e.toString());
    }
  }
}
