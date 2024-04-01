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
    apiKey: 'AIzaSyB_bW5RwF5d6d1eY4y_LzlAVLlCCxvtNCk',
    appId: '1:584611123617:web:94bf1fb11562d4ec487be0',
    messagingSenderId: '584611123617',
    projectId: 'um-library',
    authDomain: 'um-library.firebaseapp.com',
    storageBucket: 'um-library.appspot.com',
    measurementId: 'G-3F28DNVPNT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTPpJTOuIZNq9b5cMYJ42NqA8n8JXIRxU',
    appId: '1:584611123617:android:86d1956d0a94aa2b487be0',
    messagingSenderId: '584611123617',
    projectId: 'um-library',
    storageBucket: 'um-library.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABxdoo2UxtVC3Pdw39WPOMgTY70eD44Z8',
    appId: '1:584611123617:ios:586345175f6c26c9487be0',
    messagingSenderId: '584611123617',
    projectId: 'um-library',
    storageBucket: 'um-library.appspot.com',
    iosBundleId: 'ium.library.mobile.umLibrary',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyABxdoo2UxtVC3Pdw39WPOMgTY70eD44Z8',
    appId: '1:584611123617:ios:2dff3242c9537c9c487be0',
    messagingSenderId: '584611123617',
    projectId: 'um-library',
    storageBucket: 'um-library.appspot.com',
    iosBundleId: 'ium.library.mobile.umLibrary.RunnerTests',
  );
}
