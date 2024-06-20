// ignore_for_file: must_be_immutable

import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/core/helper/validator_helper.dart';
import 'package:aktaris_app/presentation/ui/auth/login/login_page.dart';
import 'package:aktaris_app/presentation/ui/auth/register/register_controller.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:aktaris_app/presentation/widget/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../reset_password/reset_password_page.dart';

class RegisterPage extends GetView<RegisterController> {
  static String routeName = '/register';
  const RegisterPage({super.key});

  //bool agree = true;
  void _dothis() {
    // Do something
  }

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
                Image.asset(
                  'assets/images/aktaris_logo_green.png',
                  width: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Daftar',
                  style: AppStyle.title2.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?',
                      style: AppStyle.body1,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed(LoginPage.routeName);
                      },
                      child: Text(
                        'Masuk',
                        style: AppStyle.body1.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Form(
                  key: controller.formKeyRegister,
                  child: Column(
                    children: [
                      CustomFieldForm(
                        // controller: controller.emailController,
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
                      const SizedBox(
                        height: 15,
                      ),
                      CustomFieldForm(
                        // controller: controller.noTelponController,
                        label: 'No. Telpon',
                        hint: 'Masukan No. Telpon',
                        keyboardType: TextInputType.phone,
                        icon: Icons.phone,
                        maxLines: 1,
                        validator: (value) => ValidatorHelper.field(
                            title: 'no telpon',
                            value: value.toString(),
                            regex: AppRegex.phone,
                            message: "No Hp tidak valid"),
                        onChanged: (value) {
                          debugPrint(value);
                          controller.phoneNumber.value = value;
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Obx(
                        () => CustomPasswordFieldForm(
                          // controller: controller.passwordController,
                          label: 'Kata Sandi',
                          hint: 'Masukan kata sandi',
                          hiddenText: controller.hiddenText.value,
                          icon: Icons.lock,
                          validator: (value) => ValidatorHelper.field(
                              title: 'kata sandi',
                              value: value.toString(),
                              regex: AppRegex.password,
                              message:
                                  "kata sandi butuh 1 Huruf Besar dan angka"),
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
                            controller.password.value = value;
                            return null;
                          },
                          // endIcon: ,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Obx(
                        () => CustomPasswordFieldForm(
                          label: 'Konfirmasi Kata Sandi',
                          hint: 'Masukan ulang kata sandi',
                          icon: Icons.lock,
                          hiddenText: controller.hiddenText1.value,
                          validator: (value) => ValidatorHelper.field(
                            title: 'konfirmasi kata sandi',
                            value: value.toString(),
                            regex: AppRegex.password,
                            message: "kata sandi butuh 1 Huruf Besar dan angka",
                          ),
                          endIcon: IconButton(
                            icon: Icon((controller.hiddenText1.value)
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              controller.hiddenText1.value =
                                  !controller.hiddenText1.value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Material(
                        child: Obx(
                          () => Checkbox(
                            value: controller.agree.value,
                            onChanged: (value) {
                              // /print(controller.agree.value);
                              controller.agree.value =
                                  controller.agree.value ? false : true;
                            },
                          ),
                        ),
                      ),
                      Text(
                        'Saya menyetujui',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.body3.copyWith(color: Colors.black),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 6),
                        ),
                        child: Text(
                          'Syarat dan Ketentuan',
                          style: AppStyle.body3.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(RegisterPage.routeName);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => SkyButton(
                    onPressed: () {
                      if (ValidatorHelper.validateForm(
                          controller.formKeyRegister)) {
                        controller.register();
                      }
                    },
                    enabled: controller.agree.value,
                    child:
                        // const Text('Continue')
                        Text(
                      'Daftar Akun',
                      style: AppStyle.body1.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
