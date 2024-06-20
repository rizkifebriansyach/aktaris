import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/presentation/ui/auth/otp/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/usecase/auth/register_usecase.dart';

class RegisterController extends GetxController {
  final RegisterUsecase registerUsecase;
  RegisterController(this.registerUsecase);

  RxBool hiddenText = true.obs;
  RxBool hiddenText1 = true.obs;

  RxBool agree = false.obs;

  final formKeyRegister = GlobalKey<FormState>();

  var phoneNumber = Rxn<String>();
  var email = Rxn<String>();
  var password = Rxn<String>();

  void register() async {
    debugPrint("Starting registration process...");

    debugPrint("Form validation successful, proceeding with registration...");
    LoadingDialog.show();
    final result = await registerUsecase.execute(ReqisterParams(
        phoneNumber: phoneNumber.value!,
        email: email.value!,
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
    formKeyRegister.currentState!.dispose();
    super.dispose();
  }
}
