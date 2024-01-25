import 'package:freezed_annotation/freezed_annotation.dart';
part 'authstate.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required String verificationId,
    required int? resendToken,
  }) = _AuthState;
}
