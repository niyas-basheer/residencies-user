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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAQ2cjPpFANFwBwTO_yXYMB3ZgHosX9KXY',
    appId: '1:811279568514:web:e5600f60e162c324e4ee9b',
    messagingSenderId: '811279568514',
    projectId: 'stay-application-b309e',
    authDomain: 'stay-application-b309e.firebaseapp.com',
    storageBucket: 'stay-application-b309e.appspot.com',
    measurementId: 'G-Y21F0E3FJK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdUmvnwX0Lra8l4eB0ATfYpuyu3VowSOI',
    appId: '1:811279568514:android:c6baedf23aa0f735e4ee9b',
    messagingSenderId: '811279568514',
    projectId: 'stay-application-b309e',
    storageBucket: 'stay-application-b309e.appspot.com',
  );
}