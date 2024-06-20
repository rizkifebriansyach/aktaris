import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/domain/usecase/auth/login_usecase.dart';
import 'package:aktaris_app/presentation/ui/auth/otp/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/usecase/auth/register_usecase.dart';

class LoginController extends GetxController {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  LoginController(this.loginUsecase, this.registerUsecase);

  final formKeyLogin = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var email = Rxn<String>();
  var password = Rxn<String>();

  RxBool hiddenText = true.obs;

  login() async {
    LoadingDialog.show();
    final result = await loginUsecase.execute(LoginParams(
      email: email.value!.toLowerCase(),
      password: password.value!,
    ));
    result.fold((error) {
      LoadingDialog.dismiss();
      debugPrint(error.message);
      DialogHelper.failed(
        message: error.message!,
        title: "Gagal",
        onConfirm: () => (error.toString == "Email belum terverifikasi")
            ? register()
            : Get.back(),
      );
    }, (response) {
      LoadingDialog.dismiss();
      debugPrint("userid : ${response.user?.userId}");
      Get.toNamed(OtpPage.routeName,
          arguments: [email.value, response.user?.userId, false]);
    });
  }

  void register() async {
    debugPrint("Starting registration process...");

    debugPrint("Form validation successful, proceeding with registration...");
    LoadingDialog.show();
    final result = await registerUsecase.execute(ReqisterParams(
        phoneNumber: LocalStorage.to.getRegisData()!.user!.phoneNumber!,
        email: email.value!.toLowerCase(),
        password: password.value!));
    debugPrint("Register use case executed");
    result.fold(
      (error) {
        LoadingDialog.dismiss();
        debugPrint("Masuk sini $error");
        DialogHelper.failed(
          title: "Gagal",
          message: error.message!,
          onConfirm: () => Get.back(),
        );
      },
      (response) {
        LoadingDialog.dismiss();
        debugPrint("Response: ${response.toString()}");
        Get.offAllNamed(OtpPage.routeName,
            arguments: [email.value, response.user?.userId, true]);
      },
    );
  }

  @override
  void dispose() {
    formKeyLogin.currentState?.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
