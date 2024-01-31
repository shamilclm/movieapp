// ignore_for_file: use_build_context_synchronously, implementation_imports

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movieapp/core/exeption/auth/signin_exeption.dart';

import 'package:movieapp/features/data/darasource/firebase_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_datasource_impl.g.dart';

class FirebaseAuthMethodsImpl implements FireBaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethodsImpl(this._auth);

  @override
  Future<UserCredential> signupwithemail({
    required String email,
    required String password,
  }) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    //  try {
    //   await _auth.createUserWithEmailAndPassword(email: email, password: password);
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     throw Signupexeption('Password is weak', 'weak password');
    //   } else if (e.code == 'email-already-in-use') {
    //     throw Signupexeption(
    //         'The account already exixsts', 'account already exists');
    //   }
    // }
  }

  @override
  Future<UserCredential> signinwithemail(
      {required String email, required String password}) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signout() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }

  @override
  Future<void> emailVerification() async {
    await _auth.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> signInwithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> forgetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<(String, int?)> loginphone(String phone, [int? resendToken]) async {
    try {
      final verificationIdCompleter = Completer<String>();
      final resendTokenCompleter = Completer<int>();
      await FirebaseAuth.instance.verifyPhoneNumber(
        forceResendingToken: resendToken,
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {}
        },
        codeSent: (String? verificationId, int? resendToken) async {
          verificationIdCompleter.complete(verificationId);
          resendTokenCompleter.complete(resendToken);
        },
        codeAutoRetrievalTimeout: (String verificationId) async {},
      );
      final verificationId = await verificationIdCompleter.future;
      final newResendToken = await resendTokenCompleter.future;
      return (verificationId, newResendToken);
    } on Exception {
      throw SigninExeption('cannot login', 'please try again');
    }
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    await _auth.signInWithCredential(credential);
  }
}

@riverpod
FireBaseAuthMethods firebaseMethods(FirebaseMethodsRef ref) {
  return FirebaseAuthMethodsImpl(FirebaseAuth.instance);
}
