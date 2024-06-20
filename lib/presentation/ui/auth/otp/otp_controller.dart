import 'dart:async';

import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/core/database/shared_prefs.dart';
import 'package:aktaris_app/core/extension/string_extension.dart';
import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/domain/usecase/auth/resend_login_otp_usecase.dart';
import 'package:aktaris_app/domain/usecase/auth/resend_register_otp_usecase.dart';
import 'package:aktaris_app/domain/usecase/auth/verify_login_usecase.dart';
import 'package:aktaris_app/domain/usecase/auth/verify_register_usecase.dart';
import 'package:aktaris_app/presentation/ui/auth/login/login_page.dart';
import 'package:aktaris_app/presentation/ui/bottom_navbar/navbar_component.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpController extends GetxController {
  final VerifyLoginUsecase verifyLoginUsecase;
  final VerifyRegisterUsecase verifyRegisterUsecase;
  final ResendLoginOtpUsecase resendLoginOtpUsecase;
  final ResendRegisterOtpUsecase resendRegisterOtpUsecase;

  OtpController(
    this.verifyLoginUsecase,
    this.verifyRegisterUsecase,
    this.resendLoginOtpUsecase,
    this.resendRegisterOtpUsecase,
  );

  final formKeyOtp = GlobalKey<FormState>();
  final otpController = TextEditingController();

  StreamController<ErrorAnimationType>? errorOTPController =
      StreamController<ErrorAnimationType>();

  RxInt timerDuration = 0.obs;
  var hiddenEmail = Rxn<String>();
  var userId = Rxn<int>();
  RxBool isRegister = false.obs;

  @override
  onInit() {
    super.onInit();
    hiddenEmail.value = Get.arguments[0];
    userId.value = Get.arguments[1];
    isRegister.value = Get.arguments[2];

    if (hiddenEmail.value != null) {
      for (int i = 3; i < hiddenEmail.value!.length - 10; i++) {
        hiddenEmail.value = ''.replaceCharAt(hiddenEmail.value!, i, '*');
      }
    }
  }

  postOtp() async {
    LoadingDialog.show();
    if (isRegister.value != false) {
      // debugPrint("isRegister : ${isRegister.value}");
      debugPrint("masuk sini ga?");
      debugPrint("userId : ${userId.value}");
      debugPrint("otp : ${otpController.text}");
      debugPrint("isRegister : ${isRegister.value}");
      final result = await verifyRegisterUsecase.execute(VerifyRegisterParams(
          userId: userId.value!, otpCode: otpController.text));
      result.fold((error) {
        LoadingDialog.dismiss();
        DialogHelper.failed(
          message: error.message!,
          title: "Gagal",
          onConfirm: () => Get.back(),
        );
      }, (response) {
        LoadingDialog.dismiss();
        Get.offAllNamed(LoginPage.routeName);
      });
    } else {
      debugPrint("OTP : ${otpController.text}");
      debugPrint("atau masuk kesini?");
      debugPrint("isRegister : ${isRegister.value}");
      final result = await verifyLoginUsecase.execute(VerifyLoginParams(
          userId: userId.value!, otpCode: otpController.text));
      result.fold((error) {
        LoadingDialog.dismiss();
        DialogHelper.failed(
          message: error.message!,
          title: "Gagal",
          onConfirm: () => Get.back(),
        );
      }, (response) {
        LoadingDialog.dismiss();
        debugPrint("Data : ${response.user.toString()}");
        prefs.setBool(KeyPrefs.isLoggedIn, true);
        // AuthManager.find.saveUserData(user: response);
        DialogHelper.success(
            message: response.message!,
            title: "Berhasil",
            onConfirm: () {
              Get.offAllNamed(BottomNavBarComponent.routeName);
            });
      });
    }
  }

  resendOtp() async {
    if (isRegister.value != false) {
      LoadingDialog.show();
      final result = await resendRegisterOtpUsecase
          .execute(ResendRegisterOtpParams(userId: userId.value!));
      result.fold(
        (error) {
          LoadingDialog.dismiss();
          DialogHelper.failed(
            message: error.message!,
            title: "Gagal",
            onConfirm: () => Get.back(),
          );
        },
        (response) {
          LoadingDialog.dismiss();
          Fluttertoast.showToast(
              msg:
                  "Kode OTP sudah dikirim ke email anda. silahkan periksa email anda",
              textColor: Colors.white,
              backgroundColor: AppColors.primary,
              toastLength: Toast.LENGTH_LONG);
        },
      );
    } else {
      LoadingDialog.show();
      final result = await resendLoginOtpUsecase
          .execute(ResendLoginOtpParams(userId: userId.value!));
      result.fold(
        (error) {
          LoadingDialog.dismiss();
          DialogHelper.failed(
            message: error.message!,
            title: "Gagal",
            onConfirm: () => Get.back(),
          );
        },
        (response) {
          LoadingDialog.dismiss();
          Fluttertoast.showToast(
            msg:
                "Kode OTP Login telah dikirim ulang ke email anda",
            textColor: Colors.white,
            backgroundColor: AppColors.primary,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
          );
        },
      );
    }
  }

  setTimer() {
    timerDuration.value = 60;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timerDuration.value--;
      if (timerDuration.value <= 0) timer.cancel();
    });
  }
}
