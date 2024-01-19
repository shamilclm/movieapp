

import 'package:movieapp/core/exeption/auth/base_exeption.dart';

class SigninExeption extends Baseexeption{
  final String code;
  SigninExeption(super.message,this.code);
}