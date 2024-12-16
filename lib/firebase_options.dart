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
    apiKey: 'AIzaSyCcIqOMidluy6aob0WvU3pxQbeT5wQtMh8',
    appId: '1:203068495554:web:d0d85a934bc32905be0d5b',
    messagingSenderId: '203068495554',
    projectId: 'osaprotrack1-7b1d1',
    authDomain: 'osaprotrack1-7b1d1.firebaseapp.com',
    storageBucket: 'osaprotrack1-7b1d1.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCeXbJGU-zOVNneS64Sh55BkwVlY8vc4IE',
    appId: '1:203068495554:android:ebae11ea6a874d5bbe0d5b',
    messagingSenderId: '203068495554',
    projectId: 'osaprotrack1-7b1d1',
    storageBucket: 'osaprotrack1-7b1d1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3sbMi4aZWH-snM5inMS_4lJdHDF8LOSA',
    appId: '1:203068495554:ios:9f4fa03cb86fc1babe0d5b',
    messagingSenderId: '203068495554',
    projectId: 'osaprotrack1-7b1d1',
    storageBucket: 'osaprotrack1-7b1d1.firebasestorage.app',
    iosBundleId: 'com.example.osaprotrack1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3sbMi4aZWH-snM5inMS_4lJdHDF8LOSA',
    appId: '1:203068495554:ios:9f4fa03cb86fc1babe0d5b',
    messagingSenderId: '203068495554',
    projectId: 'osaprotrack1-7b1d1',
    storageBucket: 'osaprotrack1-7b1d1.firebasestorage.app',
    iosBundleId: 'com.example.osaprotrack1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCcIqOMidluy6aob0WvU3pxQbeT5wQtMh8',
    appId: '1:203068495554:web:85e68e64a74573cabe0d5b',
    messagingSenderId: '203068495554',
    projectId: 'osaprotrack1-7b1d1',
    authDomain: 'osaprotrack1-7b1d1.firebaseapp.com',
    storageBucket: 'osaprotrack1-7b1d1.firebasestorage.app',
  );
}