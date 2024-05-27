// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDY7unkk0EXIawOGhrSxqXwhElw_ZsYLe8',
    appId: '1:549699116209:web:032a8883d58fb803781690',
    messagingSenderId: '549699116209',
    projectId: 'smart-home-e138f',
    authDomain: 'smart-home-e138f.firebaseapp.com',
    storageBucket: 'smart-home-e138f.appspot.com',
    measurementId: 'G-JWY1WRLZGC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDX5JUnKJJVprE2YNOUqOg7TQw3bV1Ppk',
    appId: '1:549699116209:android:a8b9612fb36cfcca781690',
    messagingSenderId: '549699116209',
    projectId: 'smart-home-e138f',
    storageBucket: 'smart-home-e138f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0sZePnb7deA9firW4Bf8NY2rogAKBLVA',
    appId: '1:549699116209:ios:f1ad80547a56c618781690',
    messagingSenderId: '549699116209',
    projectId: 'smart-home-e138f',
    storageBucket: 'smart-home-e138f.appspot.com',
    iosBundleId: 'com.example.smartHome',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0sZePnb7deA9firW4Bf8NY2rogAKBLVA',
    appId: '1:549699116209:ios:f1ad80547a56c618781690',
    messagingSenderId: '549699116209',
    projectId: 'smart-home-e138f',
    storageBucket: 'smart-home-e138f.appspot.com',
    iosBundleId: 'com.example.smartHome',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDY7unkk0EXIawOGhrSxqXwhElw_ZsYLe8',
    appId: '1:549699116209:web:e32f8bab324afa48781690',
    messagingSenderId: '549699116209',
    projectId: 'smart-home-e138f',
    authDomain: 'smart-home-e138f.firebaseapp.com',
    storageBucket: 'smart-home-e138f.appspot.com',
    measurementId: 'G-8HRBB9XRCG',
  );
}
