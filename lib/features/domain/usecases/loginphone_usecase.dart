import 'package:movieapp/core/exeption/auth/base_exeption.dart';
import 'package:movieapp/core/exeption/auth/invalid_exeption.dart';
import 'package:movieapp/features/domain/repository/auth_repository.dart';

final class Loginphonenusecase {
  final Authrepository repository;
  Loginphonenusecase({required this.repository});
  Future<(String, int?)> call(String phone) async {
    if (phone.trim().isEmpty) {
      throw InvalidFailedExeption();
    }
    try {
      return await repository.loginphone(phone);
    } on Exception catch (e) {
      throw Baseexeption("enter your phonenumber correctly");
    }
  }
}
