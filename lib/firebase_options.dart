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
    apiKey: 'AIzaSyDWvmxKX7kZzmViw3EzZXc2LJ6ZwC5aPic',
    appId: '1:51026523276:web:9f4a5660f88d92f9c277a9',
    messagingSenderId: '51026523276',
    projectId: 'sayoxatasom',
    authDomain: 'sayoxatasom.firebaseapp.com',
    storageBucket: 'sayoxatasom.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYbN0kmIyUIwfjVCC1_eG79P2zjYdaR_Q',
    appId: '1:51026523276:android:cfb6a977e900e36ac277a9',
    messagingSenderId: '51026523276',
    projectId: 'sayoxatasom',
    storageBucket: 'sayoxatasom.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAXUysBtdL6gDq5R-iNjukqAodwHKtYGEM',
    appId: '1:51026523276:ios:0abc625ce871eb2dc277a9',
    messagingSenderId: '51026523276',
    projectId: 'sayoxatasom',
    storageBucket: 'sayoxatasom.appspot.com',
    iosBundleId: 'com.example.dars72',
  );
}
