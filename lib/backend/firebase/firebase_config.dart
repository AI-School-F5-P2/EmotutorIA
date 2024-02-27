import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD6AM7jD56Jp1PfTAihtTUedRTUYnG39SU",
            authDomain: "emotutoria.firebaseapp.com",
            projectId: "emotutoria",
            storageBucket: "emotutoria.appspot.com",
            messagingSenderId: "795226650621",
            appId: "1:795226650621:web:39a7ad06f2afe2a309cb94"));
  } else {
    await Firebase.initializeApp();
  }
}
