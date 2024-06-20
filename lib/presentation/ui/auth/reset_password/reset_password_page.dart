import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/presentation/ui/auth/login/login_page.dart';
import 'package:aktaris_app/presentation/ui/auth/reset_password/reset_password_controller.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/helper/validator_helper.dart';
import '../../../widget/custom_field.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  static String routeName = '/reset-password';
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Obx(() => (controller.sendEmail.value == false)
          ? SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/reset_password_image.svg',
                      width: 200,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Atur ulang kata sandi',
                        style: AppStyle.headline3,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Masukan email Anda yang sudah terdaftar',
                        style: AppStyle.body1,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: controller.formKeyResetPassword,
                      child: Column(
                        children: [
                          CustomFieldForm(
                            label: 'Email',
                            hint: 'Masukan email',
                            keyboardType: TextInputType.emailAddress,
                            icon: Icons.mail,
                            maxLines: 1,
                            validator: (value) => ValidatorHelper.field(
                              title: 'email',
                              value: value.toString(),
                              regex: AppRegex.email,
                            ),
                            onChanged: (value) {
                              controller.email.value = value;
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SkyButton(
                        text: 'Kirim',
                        textColor: Colors.white,
                        onPressed: () {
                          controller.postResetPassword();
                        })
                  ],
                ),
              ),
            )
          : emailCheckPresentation()),
    );
  }

  Widget emailCheckPresentation() {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      height: MediaQuery.of(Get.context!).size.height,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          SvgPicture.asset(
            "assets/images/succed_email.svg",
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text(
              "Periksa email Anda untuk melanjutkan proses pembaruan kata sandi Anda\nJika sudah melakukan pembaruan kata sandi silahkan klik tombol dibawah ini",
              style: AppStyle.body1.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SkyButton(
                color: AppColors.primary,
                text: 'Selesai',
                textColor: Colors.white,
                onPressed: () => Get.offAllNamed(LoginPage.routeName)),
          )
        ],
      ),
    );
  }
}
