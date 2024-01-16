import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'FIREBASE_MESSAGING_SENDER_ID')
  static String firebaseMessagingId = _Env.firebaseMessagingId;

  @EnviedField(varName: 'FIREBASE_PROJECT_ID')
  static String firebaseProjectId = _Env.firebaseProjectId;

  @EnviedField(varName: 'FIREBASE_STORAGE_BUCKET')
  static String firebaseStorageBucket = _Env.firebaseStorageBucket;

  @EnviedField(varName: 'FIREBASE_MEASUREMENT_ID')
  static String firebaseMeasurementId = _Env.firebaseMeasurementId;

  @EnviedField(varName: 'FIREBASE_AUTH_DOMAIN')
  static String firebaseAuthDomain = _Env.firebaseAuthDomain;

  // Web env variables
  @EnviedField(varName: 'FIREBASE_WEB_API_KEY')
  static String firebaseWebAPIKey = _Env.firebaseWebAPIKey;

  @EnviedField(varName: 'FIREBASE_WEB_APP_ID')
  static String firebaseWebAppId = _Env.firebaseWebAppId;

  // Android env variables
  @EnviedField(varName: 'FIREBASE_ANDROID_API_KEY')
  static String firebaseAndroidAPIKey = _Env.firebaseAndroidAPIKey;

  @EnviedField(varName: 'FIREBASE_ANDROID_APP_ID')
  static String firebaseAndroidAppId = _Env.firebaseAndroidAppId;

  // IOS env variables
  @EnviedField(varName: 'FIREBASE_IOS_API_KEY')
  static String firebaseIOSAPIKey = _Env.firebaseIOSAPIKey;

  @EnviedField(varName: 'FIREBASE_IOS_APP_ID')
  static String firebaseIOSAppId = _Env.firebaseIOSAppId;

  @EnviedField(varName: 'FIREBASE_IOS_BUNDLE_ID')
  static String firebaseIOSBundleId = _Env.firebaseIOSBundleId;
}
