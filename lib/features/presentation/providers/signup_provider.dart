import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/exeption/auth/base_exeption.dart';
import 'package:movieapp/core/utils/show_snackbar_utils.dart';
import 'package:movieapp/features/data/repository/auth_repository_impl.dart';
import 'package:movieapp/features/domain/repository/auth_repository.dart';
import 'package:movieapp/features/domain/usecases/emailverification_usecase.dart';
import 'package:movieapp/features/domain/usecases/forgetpassword_usecase.dart';
import 'package:movieapp/features/domain/usecases/googlesign_usecase.dart';
import 'package:movieapp/features/domain/usecases/loginphone_usecase.dart';
import 'package:movieapp/features/domain/usecases/signin_usecase.dart';
import 'package:movieapp/features/domain/usecases/signout_usecase.dart';
import 'package:movieapp/features/domain/usecases/signup_usecase.dart';
import 'package:movieapp/features/domain/usecases/verifyotp_usecase.dart';
import 'package:movieapp/features/presentation/pages/otp_page.dart';
import 'package:movieapp/features/presentation/providers/authstate.dart';
import 'package:movieapp/features2/presentation/pages/homepage_pages.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'signup_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final Authrepository repository;
  @override
  AuthState build() {
    repository = ref.read(authRepositoryProvider);
    return AuthState(verificationId: '', resendToken: null);
  }

  // void dispose() {}

  Future<void> signUpWithEmail(
      BuildContext context, String email, String password) async {
    try {
      await SignupUsecase(repository: repository)(email, password);
      await emailVerification(context);
      Future.sync(() => context.push(Homepage.routepath));
    } on Baseexeption catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> signinWithEmail(
      BuildContext context, String email, String password) async {
    try {
      await Signinusecase(repository: repository)(email, password);
      Future.sync(() => context.push(Homepage.routepath));
    } on Baseexeption catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> signout(BuildContext context) async {
    await Signoutusecase(repository: repository)();
  }

  Future<void> emailVerification(BuildContext context) async {
    try {
      await EmailverifyUsecase(repository: repository)();
    } on Baseexeption catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> signInwithGoogle(BuildContext context) async {
    try {
      await GoogleverifyUsecase(repository: repository)();
      Future.sync(() => context.push(Homepage.routepath));
    } on Baseexeption catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> passwordReset(BuildContext context, String email) async {
    try {
      await ForgetpasswordUsecase(repository: repository)(email);
    } on Baseexeption catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> signInWithPhone(BuildContext context, String phone) async {
    try {
      final verificationData =
          await Loginphonenusecase(repository: repository)(phone);
      state = AuthState(
          verificationId: verificationData.$1,
          resendToken: verificationData.$2);
      Future.sync(() => context.push(Otp.routepath));
    } on Baseexeption catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    try {
      await VerifyOtpusecase(repository: repository)(state.verificationId, otp);
      Future.sync(() => context.go(Homepage.routepath));
    } on Baseexeption catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }
}
