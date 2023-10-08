import 'dart:convert';

import 'package:confess/model/user_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  PrefsHelper._privateConstructor();
  late SharedPreferences _prefs;
  static final PrefsHelper _instance = PrefsHelper._privateConstructor();
  static PrefsHelper get instance => _instance;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //isLoggedIn
  Future<bool> get isLoggedIn async {
    return _prefs.getBool('isLoggedIn') ?? false;
  }

  Future<void> setLoggedIn({required bool value}) async {
    await _prefs.setBool('isLoggedIn', value);
  }

  //set user data from usermodel
  Future<void> setUserData({required UserModel userModel}) async {
    await _prefs.setString('userData', jsonEncode(userModel.toJson()));
  }

  //get user data from usermodel
  UserModel? get userData {
    final data = _prefs.getString('userData');
    if (data != null) {
      return UserModel.fromJson(jsonDecode(data) as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}
