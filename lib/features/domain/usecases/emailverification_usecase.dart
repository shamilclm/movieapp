

import 'package:movieapp/core/exeption/auth/signup_exeption.dart';
import 'package:movieapp/features/domain/repository/auth_repository.dart';

final class EmailverifyUsecase{
  final Authrepository repository;
  EmailverifyUsecase({required this.repository});
  Future<void>call()async{
    try{
      await repository.emailVerification();
    }on Exception{
      throw Signupexeption('connot login','try again');
    }
  }

}