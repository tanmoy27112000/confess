import 'package:appwrite/appwrite.dart';
import 'package:confess/constant/contant.dart';

class AppwriteHelper {
  AppwriteHelper._privateConstructor();
  static final AppwriteHelper _instance = AppwriteHelper._privateConstructor();
  static AppwriteHelper get instance => _instance;

  Client client = Client();
  String projectId = '64bc278af30a7c835126';

  void init() {
    logger.d('Appwrite intialized -- ${secretModel.appwriteProject}');
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject(secretModel.appwriteProject)
        .setSelfSigned();
  }
}
