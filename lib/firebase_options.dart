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
    apiKey: 'AIzaSyA81K3Wcrf_F_fvZ7lzrRzPVUHcj1cWUC4',
    appId: '1:669476416798:web:8147f9a11d488372826d0f',
    messagingSenderId: '669476416798',
    projectId: 'akek-register-screen',
    authDomain: 'akek-register-screen.firebaseapp.com',
    storageBucket: 'akek-register-screen.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0v58oRUbrrlMQQDufU2k-z_jRn2QrG9k',
    appId: '1:669476416798:android:bbcfa366dcad4675826d0f',
    messagingSenderId: '669476416798',
    projectId: 'akek-register-screen',
    storageBucket: 'akek-register-screen.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAXAQghC2zL_aSedCR65CKCmtyHJrZEktw',
    appId: '1:669476416798:ios:f560c36b0fc84d93826d0f',
    messagingSenderId: '669476416798',
    projectId: 'akek-register-screen',
    storageBucket: 'akek-register-screen.appspot.com',
    iosClientId:
        '669476416798-2bc5n3qjqg57saj4mro41ruuvr98mqlk.apps.googleusercontent.com',
    iosBundleId: 'wixforum.com.registrationScreen',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAXAQghC2zL_aSedCR65CKCmtyHJrZEktw',
    appId: '1:669476416798:ios:f560c36b0fc84d93826d0f',
    messagingSenderId: '669476416798',
    projectId: 'akek-register-screen',
    storageBucket: 'akek-register-screen.appspot.com',
    iosClientId:
        '669476416798-2bc5n3qjqg57saj4mro41ruuvr98mqlk.apps.googleusercontent.com',
    iosBundleId: 'wixforum.com.registrationScreen',
  );
}