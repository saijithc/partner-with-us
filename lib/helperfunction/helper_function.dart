import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFuction with ChangeNotifier {
  static String sharedPreferenceUserLoggedInkey = "ISLOGGEDIN";
  Future<bool> saveUserLogged(bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool(sharedPreferenceUserLoggedInkey, isUserLoggedIn);
  }

  Future<bool?> getUserLogged() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(sharedPreferenceUserLoggedInkey);
  }
}
