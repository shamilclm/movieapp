import 'package:movieapp/core/exeption/auth/base_exeption.dart';

class SignoutExeption extends Baseexeption {
  final String code;
  SignoutExeption(super.message, this.code);
}
