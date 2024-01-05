import 'package:confess/helper/prefs_helper.dart';
import 'package:confess/model/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  AuthHelper._privateConstructor();
  static final AuthHelper _instance = AuthHelper._privateConstructor();
  static AuthHelper get instance => _instance;

  ValueNotifier<bool> isLoggedIn = ValueNotifier<bool>(false);

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  //check if user is logged in
  Future<void> checkUserLoggedIn() async {
    final user = PrefsHelper.instance.userData;
    if (user != null) {
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
    }
  }

  Future<User?> signInWithGoogle() async {
    // Initialize Firebase

    User? user;
    final auth = FirebaseAuth.instance;
    // The `GoogleAuthProvider` can only be
    // used while running on the web
    final authProvider = GoogleAuthProvider();

    try {
      final userCredential = await auth.signInWithPopup(authProvider);
      user = userCredential.user;
    } catch (e) {
      debugPrint(e.toString());
    }

    if (user != null) {
      final uid = user.uid;
      final name = user.displayName;
      final userEmail = user.email;
      final imageUrl = user.photoURL;

      await PrefsHelper.instance.setLoggedIn(value: true);
      isLoggedIn.value = true;
      debugPrint('name: $name');
      debugPrint('userEmail: $userEmail');
      debugPrint('imageUrl: $imageUrl');

      final userModel = UserModel(
        uid: uid,
        displayName: name ?? '',
        email: userEmail ?? '',
        photoUrl: imageUrl ?? '',
      );

      await PrefsHelper.instance.setUserData(userModel: userModel);
    }
    return user;
  }

  void signOut() {
    _googleSignIn.signOut();
    PrefsHelper.instance.clear();
    isLoggedIn.value = false;
  }
}
