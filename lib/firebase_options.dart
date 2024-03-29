// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBNdsLbb1Gl9gGoZIRwtJjhTAB2Wsp68KM',
    appId: '1:1064877343114:web:d5784190be29d6bd26c873',
    messagingSenderId: '1064877343114',
    projectId: 'movie-app-96352',
    authDomain: 'movie-app-96352.firebaseapp.com',
    storageBucket: 'movie-app-96352.appspot.com',
    measurementId: 'G-XSVFXW5G2S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1_8ATH1lnU1MpQvOxyToVguRzsYOy7rU',
    appId: '1:1064877343114:android:4fe477d47d73eb7626c873',
    messagingSenderId: '1064877343114',
    projectId: 'movie-app-96352',
    storageBucket: 'movie-app-96352.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAadvDWO3ttlFkQHDqruYWuqzIQAIJHQtM',
    appId: '1:1064877343114:ios:52a27c5d4a33e46d26c873',
    messagingSenderId: '1064877343114',
    projectId: 'movie-app-96352',
    storageBucket: 'movie-app-96352.appspot.com',
    iosClientId: '1064877343114-se7b110erj3pgnlv0efql93k81u8lthc.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieapp',
  );
}
