import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/features/presentation/pages/login_pages.dart';
import 'package:movieapp/features/presentation/pages/phone_page.dart';
import 'package:movieapp/features/presentation/pages/signup_pages.dart';
import 'package:movieapp/features2/presentation/pages/homepage_pages.dart';

final router = GoRouter(initialLocation: Homepage.routepath, routes: [
  GoRoute(
    path: Homepage.routepath,
    name: 'homepage',
    builder: (context, state) => const Homepage(),
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null || !user.emailVerified) {
        return MyLogin.routepath;
      }
      return null;
    },
  ),
  GoRoute(
    path: MyLogin.routepath,
    name: 'loginpage',
    builder: (context, state) => const MyLogin(),
  ),
  GoRoute(
    path: Mysignup.routepath,
    name: 'signup',
    builder: (context, state) => const Mysignup(),
  ),
  GoRoute(
    path: Myphone.routepath,
    builder: (context, state) => const Myphone(),
  )
]);
