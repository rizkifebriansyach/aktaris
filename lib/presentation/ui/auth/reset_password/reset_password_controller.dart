import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/domain/usecase/auth/reset_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final ResetPasswordUsecase resetPasswordUsecase;
  ResetPasswordController(this.resetPasswordUsecase);

  final formKeyResetPassword = GlobalKey<FormState>();

  var email = Rxn<String>();

  RxBool hiddenText = true.obs;
  RxBool hiddenText1 = true.obs;
  RxBool sendEmail = false.obs;

  postResetPassword() async {
    LoadingDialog.show();
    final result = await resetPasswordUsecase
        .execute(ResetPasswordParams(email: email.value!));
    result.fold((error) {
      LoadingDialog.dismiss();
      DialogHelper.failed(
        message: error.message!,
        title: "Gagal",
        onConfirm: () => Get.back(),
      );
    }, (response) {
      LoadingDialog.dismiss();
      sendEmail.value = true;
      Fluttertoast.showToast(msg: response);
    });
  }
}
