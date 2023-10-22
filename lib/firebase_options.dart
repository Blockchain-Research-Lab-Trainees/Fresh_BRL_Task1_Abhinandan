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
    apiKey: 'AIzaSyDDE77LWSp0JzlmbDvCGPqzgrltp-SC5Dk',
    appId: '1:953436026738:web:e843673a3113fa96998feb',
    messagingSenderId: '953436026738',
    projectId: 'fir-demo-46b7b',
    authDomain: 'fir-demo-46b7b.firebaseapp.com',
    storageBucket: 'fir-demo-46b7b.appspot.com',
    measurementId: 'G-NCR02ZV9Q8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqJrBxd0_AnIpLrFU0nvGH5Wyp5uk_oUQ',
    appId: '1:953436026738:android:a1021a7b206e7cc7998feb',
    messagingSenderId: '953436026738',
    projectId: 'fir-demo-46b7b',
    storageBucket: 'fir-demo-46b7b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAE9-phs8vY7Rz2LSJsqtON9FuSZIFSMOo',
    appId: '1:953436026738:ios:56c050c9d36e49e8998feb',
    messagingSenderId: '953436026738',
    projectId: 'fir-demo-46b7b',
    storageBucket: 'fir-demo-46b7b.appspot.com',
    androidClientId: '953436026738-ionfm3ubc4j8ld43n2oncto63jakanfp.apps.googleusercontent.com',
    iosClientId: '953436026738-7kk2ev9ihkuichmn3u69cuvqimi9m410.apps.googleusercontent.com',
    iosBundleId: 'com.example.freshTask1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAE9-phs8vY7Rz2LSJsqtON9FuSZIFSMOo',
    appId: '1:953436026738:ios:1333eb52f111eb39998feb',
    messagingSenderId: '953436026738',
    projectId: 'fir-demo-46b7b',
    storageBucket: 'fir-demo-46b7b.appspot.com',
    androidClientId: '953436026738-ionfm3ubc4j8ld43n2oncto63jakanfp.apps.googleusercontent.com',
    iosClientId: '953436026738-ul4q9cq0f8em11ckrbr9dclbcjinm0g3.apps.googleusercontent.com',
    iosBundleId: 'com.example.freshTask1.RunnerTests',
  );
}
