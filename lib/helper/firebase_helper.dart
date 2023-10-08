import 'package:confess/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseHelper {
  FirebaseHelper._privateConstructor();
  static final FirebaseHelper _instance = FirebaseHelper._privateConstructor();
  static FirebaseHelper get instance => _instance;

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
