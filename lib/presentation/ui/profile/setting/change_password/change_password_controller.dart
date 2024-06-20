import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/domain/usecase/profile/change_password_usecase.dart';
import 'package:aktaris_app/presentation/ui/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final ChangePasswordUsecase changePasswordUsecase;
  ChangePasswordController(this.changePasswordUsecase);

  final formKeyChangePassword = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  var oldPassword = Rxn<String>();
  var newPassword = Rxn<String>();

  RxBool hiddenText = true.obs;
  RxBool hiddenText1 = true.obs;

  requestChangePassword() async {
    LoadingDialog.show();
    final result = await changePasswordUsecase.execute(ChangePasswordParams(
        oldPassword: oldPassword.value!, newPassword: newPassword.value!));

    result.fold((error) {
      LoadingDialog.dismiss();
      DialogHelper.failed(
        message: error.toString(),
        title: "Gagal",
        onConfirm: () => Get.back(),
      );
    }, (response) {
      LoadingDialog.dismiss();
      DialogHelper.success(
        title: "Berhasil",
        message: "Kata Sandi Berhasil Diubah",
        onConfirm: () => Get.offAllNamed(LoginPage.routeName),
      );
    });
  }

  @override
  void dispose() {
    // ignore: invalid_use_of_protected_member
    formKeyChangePassword.currentState?.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }
}
