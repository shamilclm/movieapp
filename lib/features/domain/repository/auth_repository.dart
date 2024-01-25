import 'package:firebase_auth/firebase_auth.dart';

abstract class Authrepository {
  Future<UserCredential> signupwithemail(
      {required String email, required String password});
  Future<UserCredential> signinwithemail(
      {required String email, required String password});

  Future<void> signout();
  Future<void> emailVerification();
  Future<void> signInwithGoogle();
  Future<void> resetPassword(String email);
  Future<(String, int?)> loginphone(String phone);
  Future<void> verifyOtp(String verification, String otp);
}
