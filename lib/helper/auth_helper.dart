import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  AuthHelper._privateConstructor();
  static final AuthHelper _instance = AuthHelper._privateConstructor();
  static AuthHelper get instance => _instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> googleLogin() async {}
}
