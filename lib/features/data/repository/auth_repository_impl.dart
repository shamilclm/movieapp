import 'package:firebase_auth/firebase_auth.dart';
import 'package:movieapp/features/data/darasource/firebase_datasource.dart';
import 'package:movieapp/features/data/darasource/firebase_datasource_impl.dart';
import 'package:movieapp/features/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements Authrepository {
  final FireBaseAuthMethods dataSource;
  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<void> signout() async {
    await dataSource.signout();
  }

  @override
  Future<UserCredential> signupwithemail(
      {required String email, required String password}) {
    return dataSource.signupwithemail(email: email, password: password);
  }

  @override
  Future<UserCredential> signinwithemail(
      {required String email, required String password}) {
    return dataSource.signinwithemail(email: email, password: password);
  }

  @override
  Future<void> emailVerification() async {
    await dataSource.emailVerification();
  }

  @override
  Future<void> signInwithGoogle() async {
    await dataSource.signInwithGoogle();
  }

  @override
  Future<void> resetPassword(String email) async {
    await dataSource.forgetPassword(email);
  }
}

@riverpod
AuthRepositoryImpl authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(dataSource: ref.watch(firebaseMethodsProvider));
}
