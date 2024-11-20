import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "",
            authDomain: "trad-99a99.firebaseapp.com",
            projectId: "trad-99a99",
            storageBucket: "trad-99a99.firebasestorage.app",
            messagingSenderId: "884547623816",
            appId: "1:884547623816:web:0f93109fcdeeffeef0783d"));
  } else {
    await Firebase.initializeApp();
  }
}
