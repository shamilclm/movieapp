import 'package:movieapp/core/exeption/auth/base_exeption.dart';
import 'package:movieapp/core/exeption/auth/invalid_exeption.dart';
import 'package:movieapp/features/domain/repository/auth_repository.dart';

final class VerifyOtpusecase {
  final Authrepository repository;
  VerifyOtpusecase({required this.repository});
  Future<void> call(String verification, String otp) async {
    if (otp.trim().isEmpty) {
      throw InvalidFailedExeption();
    }
    try {
      await repository.verifyOtp(verification, otp);
    } on Exception {
      throw Baseexeption("enter your otp correctly");
    }
  }
}
