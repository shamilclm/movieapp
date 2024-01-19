// ignore_for_file: use_build_context_synchronously, implementation_imports

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
}

@riverpod
FireBaseAuthMethods firebaseMethods(FirebaseMethodsRef ref) {
  return FirebaseAuthMethodsImpl(FirebaseAuth.instance);
}
