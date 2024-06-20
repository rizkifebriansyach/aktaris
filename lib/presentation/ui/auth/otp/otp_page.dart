import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/presentation/ui/auth/otp/otp_controller.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends GetView<OtpController> {
  static String routeName = '/otp';
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/otp_image.svg',
                  width: 200,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Verifikasi Email',
                  style: AppStyle.headline3.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Masukan kode yang dikirim ke email',
                  style: AppStyle.body2.copyWith(color: Colors.grey.shade600),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${controller.hiddenEmail.value}',
                  style: AppStyle.body2.copyWith(color: Colors.blue.shade300),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: controller.formKeyOtp,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    controller: controller.otpController,
                    autoDismissKeyboard: true,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    errorAnimationController: controller.errorOTPController,
                    // : const EdgeInsets.only(top: 15);
                    validator: (otp) {
                      if (otp!.length < 6) {
                        return "Kode OTP tidak boleh kosong!";
                      }
                      return null;
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldWidth: 50,
                      activeColor: AppColors.primary,
                      inactiveColor: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum menerima kode OTP?',
                        style: AppStyle.body3.copyWith(color: Colors.black),
                      ),
                      Obx(
                        () => (controller.timerDuration.value <= 0)
                            ? TextButton(
                                onPressed: () {
                                  controller.setTimer();
                                  controller.resendOtp();
                                },
                                child: Text(
                                  'Kirim Ulang',
                                  style: AppStyle.body3.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  '${controller.timerDuration.value} detik',
                                  style: AppStyle.body2
                                      .copyWith(color: AppColors.primary),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                SkyButton(
                  text: 'Kirim',
                  textColor: Colors.white,
                  onPressed: () {
                    controller.postOtp();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
