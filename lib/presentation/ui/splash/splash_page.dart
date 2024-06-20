import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/presentation/ui/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  static String routeName = '/splash-page';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.checkUserLoggedIn();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/aktaris_logo.png',
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
