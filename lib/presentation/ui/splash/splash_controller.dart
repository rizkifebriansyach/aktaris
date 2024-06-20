import 'dart:async';

import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/core/database/shared_prefs.dart';
import 'package:aktaris_app/presentation/ui/auth/login/login_page.dart';
import 'package:aktaris_app/presentation/ui/bottom_navbar/navbar_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
// Now you can use isLoggedIn() to check if the user is logged in.

  Future<void> checkUserLoggedIn() async {
    bool? isUserLoggedIn = await prefs.getBool(KeyPrefs.isLoggedIn);
    debugPrint("splash login $isUserLoggedIn");
    // You can then use the value of isUserLoggedIn to conditionally show different parts of your app or perform other actions.
    if (isUserLoggedIn == true) {
      // User is logged in
      // Do something
      Timer(const Duration(seconds: 2),
          () => Get.offNamed(BottomNavBarComponent.routeName));
    } else {
      Timer(const Duration(seconds: 2), () => Get.offNamed(LoginPage.routeName));
    }
  }

  // @override
  // void onReady() {
  //   // checkUserLoggedIn();
  //   super.onReady();
  // }
}
