import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAEOHzjEixoNGz4s3ugcHogl_kLngymJEU",
            authDomain: "agritrust-c88c4.firebaseapp.com",
            projectId: "agritrust-c88c4",
            storageBucket: "agritrust-c88c4.firebasestorage.app",
            messagingSenderId: "1040894106127",
            appId: "1:1040894106127:web:fe3fa01604de73f0dc617a"));
  } else {
    await Firebase.initializeApp();
  }
}
