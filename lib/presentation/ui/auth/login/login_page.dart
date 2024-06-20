import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/core/helper/validator_helper.dart';
import 'package:aktaris_app/presentation/ui/auth/login/login_controller.dart';
import 'package:aktaris_app/presentation/ui/auth/register/register_page.dart';
import 'package:aktaris_app/presentation/ui/auth/reset_password/reset_password_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/app_style.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_field.dart';

class LoginPage extends GetView<LoginController> {
  static String routeName = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/aktaris_logo_green.png',
                  width: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Masuk',
                  style: AppStyle.title2.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: controller.formKeyLogin,
                  child: Column(
                    children: [
                      CustomFieldForm(
                        label: 'Email',
                        hint: 'Masukan email',
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.mail,
                        maxLines: 1,
                        validator: (value) => ValidatorHelper.field(
                          title: 'email',
                          value: value.toString(),
                          regex: AppRegex.email,
                        ),
                        onChanged: (value) {
                          debugPrint(value);
                          controller.email.value = value;
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Obx(
                        () => CustomPasswordFieldForm(
                          label: 'Kata Sandi',
                          hint: 'Masukan kata sandi',
                          controller: controller.passwordController,
                          hiddenText: controller.hiddenText.value,
                          icon: Icons.lock,
                          // validator: (value) => ValidatorHelper.field(
                          //   title: 'Kata sandi',
                          //   value: value.toString(),
                          //   regex: AppRegex.password,
                          // ),
                          endIcon: IconButton(
                            icon: Icon((controller.hiddenText.value)
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              controller.hiddenText.value =
                                  !controller.hiddenText.value;
                            },
                          ),
                          onChanged: (value) {
                            debugPrint(value);
                            controller.password.value = value;
                            return null;
                          },
                          // endIcon: ,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(ResetPasswordPage.routeName);
                    },
                    child: Text(
                      'Lupa kata sandi?',
                      style: AppStyle.body1.copyWith(color: AppColors.primary),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SkyButton(
                  text: 'Masuk',
                  textColor: Colors.white,
                  onPressed: () {
                    if (ValidatorHelper.validateForm(controller.formKeyLogin)) {
                      controller.login();
                    }
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'Belum punya akun?',
                        style: AppStyle.body1.copyWith(color: Colors.black),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 1),
                        ),
                        child: Text(
                          'Daftar',
                          style: AppStyle.body1.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(RegisterPage.routeName);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
