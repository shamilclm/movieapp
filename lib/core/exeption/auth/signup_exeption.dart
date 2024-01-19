import 'package:movieapp/core/exeption/auth/base_exeption.dart';

class Signupexeption extends Baseexeption {
  final String code;
  Signupexeption(this.code, super.message);
}
