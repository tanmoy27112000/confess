class AuthHelper {
  AuthHelper._privateConstructor();
  static final AuthHelper _instance = AuthHelper._privateConstructor();
  static AuthHelper get instance => _instance;

  // final account = Account(AppwriteHelper.instance.client);

  Future<void> login() async {
    // final result = await account.createOAuth2Session(
    //   provider: 'google',
    //   success: 'http://localhost:62549/auth.html',
    // );

    // final user = await account.get();
    // logger.d(user.email);
  }
}
