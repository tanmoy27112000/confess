import 'package:appwrite/appwrite.dart';
import 'package:confess/constant/contant.dart';
import 'package:confess/helper/appwrite_helper.dart';

class AuthHelper {
  AuthHelper._privateConstructor();
  static final AuthHelper _instance = AuthHelper._privateConstructor();
  static AuthHelper get instance => _instance;

  final account = Account(AppwriteHelper.instance.client);

  Future<void> login() async {
    final result = await account.createOAuth2Session(
      provider: 'google',
    );

    logger.d(result);
  }
}
