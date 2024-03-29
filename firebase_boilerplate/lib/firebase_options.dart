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
        return macos;
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
    apiKey: 'AIzaSyDMSYWlbpgNWSlfbcvZk08_vfWjcfDpMpA',
    appId: '1:1070344395737:web:31a162431c5bed2af897c8',
    messagingSenderId: '1070344395737',
    projectId: 'flutter-boilerplate-39ee6',
    authDomain: 'flutter-boilerplate-39ee6.firebaseapp.com',
    storageBucket: 'flutter-boilerplate-39ee6.appspot.com',
    measurementId: 'G-47TT0G5PF4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6fsrFlfQR-gDtwk0OjVZ8sa2pHtbfmzA',
    appId: '1:1070344395737:android:0d0648870786b23ef897c8',
    messagingSenderId: '1070344395737',
    projectId: 'flutter-boilerplate-39ee6',
    storageBucket: 'flutter-boilerplate-39ee6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1nNXAYxHa3SeGRuyIorzYtwmOjP4s_j8',
    appId: '1:1070344395737:ios:3f938bf82ac22adff897c8',
    messagingSenderId: '1070344395737',
    projectId: 'flutter-boilerplate-39ee6',
    storageBucket: 'flutter-boilerplate-39ee6.appspot.com',
    iosBundleId: 'com.example.firebaseBoilerplate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1nNXAYxHa3SeGRuyIorzYtwmOjP4s_j8',
    appId: '1:1070344395737:ios:e2be064d5177f813f897c8',
    messagingSenderId: '1070344395737',
    projectId: 'flutter-boilerplate-39ee6',
    storageBucket: 'flutter-boilerplate-39ee6.appspot.com',
    iosBundleId: 'com.example.firebaseBoilerplate.RunnerTests',
  );
}
