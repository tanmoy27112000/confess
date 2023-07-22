import 'package:appwrite/appwrite.dart';

class AppwriteHelper {
  AppwriteHelper._privateConstructor();
  static final AppwriteHelper _instance = AppwriteHelper._privateConstructor();
  static AppwriteHelper get instance => _instance;

  Client client = Client();

  void init() {
    client.setEndpoint('https://cloud.appwrite.io/v1').setProject('64bc278af30a7c835126').setSelfSigned();
  }
}
