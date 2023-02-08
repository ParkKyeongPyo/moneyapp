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
    apiKey: 'AIzaSyD6irihaGQO72TyRGqk80jh_14YiG7X9N4',
    appId: '1:543607551816:web:ccfced71cee81cb4c5657d',
    messagingSenderId: '543607551816',
    projectId: 'moneyapp-218ca',
    authDomain: 'moneyapp-218ca.firebaseapp.com',
    storageBucket: 'moneyapp-218ca.appspot.com',
    measurementId: 'G-M6JK21DZGP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyk-ye5wS6Ev4ccyF3AbbZMOuGesQ3jp4',
    appId: '1:543607551816:android:fc7eadd8b5d4dfbcc5657d',
    messagingSenderId: '543607551816',
    projectId: 'moneyapp-218ca',
    storageBucket: 'moneyapp-218ca.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAu6xVw6-AtPV0qPOsxIrmZEh_yOv-ND60',
    appId: '1:543607551816:ios:4b26cfbfa23426ecc5657d',
    messagingSenderId: '543607551816',
    projectId: 'moneyapp-218ca',
    storageBucket: 'moneyapp-218ca.appspot.com',
    iosClientId: '543607551816-06om5rd7k4nenvr7tjgcphf604lsopua.apps.googleusercontent.com',
    iosBundleId: 'com.example.moneyapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAu6xVw6-AtPV0qPOsxIrmZEh_yOv-ND60',
    appId: '1:543607551816:ios:4b26cfbfa23426ecc5657d',
    messagingSenderId: '543607551816',
    projectId: 'moneyapp-218ca',
    storageBucket: 'moneyapp-218ca.appspot.com',
    iosClientId: '543607551816-06om5rd7k4nenvr7tjgcphf604lsopua.apps.googleusercontent.com',
    iosBundleId: 'com.example.moneyapp',
  );
}