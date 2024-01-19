import 'package:movieapp/core/exeption/auth/base_exeption.dart';

final class InvalidFailedExeption extends Baseexeption {
  InvalidFailedExeption() : super('invalid user input');
}
