import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

final SharedPreferences prefs = Get.find<SharedPreferences>();

class KeyPrefs {
  static const firstOpen = "onboarding";
  static const roomId = "rid";
  static const xAuthToken = "x-auth-token";
  static const xUserId = "x-user-id";
  static const isLoggedIn = "isloggedin";
  // static const signature = "signature";
  // static const roles = "roles";
  // static const isRevision = "true";
  // static const haveCA = "haveCA";
  static const marriageStatus = "mariageStatus";
}

class SPrefs {
  static Future<void> logout() async {
    await prefs.clear();
    await prefs.setBool(KeyPrefs.firstOpen, false);
  }
}
