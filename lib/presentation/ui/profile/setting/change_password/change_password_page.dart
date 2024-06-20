import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/presentation/ui/profile/setting/change_password/change_password_controller.dart';
import 'package:aktaris_app/presentation/widget/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/helper/validator_helper.dart';
import '../../../../widget/custom_appbar.dart';
import '../../../../widget/custom_button.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  static String routeName = '/change-password';
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SkyAppBar.primary(
          centerTitle: true,
          title: 'Pengaturan',
          titleStyle: const TextStyle(
              color: Colors.black, fontFamily: "Poppins", fontSize: 18),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: Colors.grey.shade200,
            thickness: 7,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ubah/Atur Kata Sandi',
                    style: AppStyle.body2.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: controller.formKeyChangePassword,
                    child: Column(
                      children: [
                        Obx(
                          () => CustomPasswordFieldForm(
                            label: 'Kata Sandi Lama',
                            hint: 'Masukan kata sandi Lama',
                            hiddenText: controller.hiddenText.value,
                            controller: controller.oldPasswordController,
                            icon: Icons.lock,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Kata Sandi Tidak Boleh Kosong!';
                              }
                              if (value.length < 8) {
                                return 'Kata sandi minimal harus terdiri dari 8 karakter';
                              }
                              if (!RegExp(AppRegex.password).hasMatch(value)) {
                                return 'harus terdiri dari huruf besar, huruf kecil, dan angka';
                              }
                              return null;
                            },
                             onChanged: (value){
                              debugPrint(value);
                              controller.oldPassword.value = value;
                              return null;
                            },
                            endIcon: IconButton(
                              icon: Icon((controller.hiddenText.value)
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                controller.hiddenText.value =
                                    !controller.hiddenText.value;
                              },
                            ),
                            // endIcon: ,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => CustomPasswordFieldForm(
                            label: 'Kata Sandi Baru',
                            hint: 'Masukan kata sandi baru',
                            icon: Icons.lock,
                            hiddenText: controller.hiddenText1.value,
                            controller: controller.newPasswordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Kata Sandi Tidak Boleh Kosong!';
                              }
                              if (value.length < 8) {
                                return 'Kata sandi minimal harus terdiri dari 8 karakter';
                              }
                              if (!RegExp(AppRegex.password).hasMatch(value)) {
                                return 'harus terdiri dari huruf besar, huruf kecil, dan angka';
                              }
                              return null;
                            },
                            onChanged: (value){
                              debugPrint(value);
                              controller.newPassword.value = value;
                              return null;
                            },
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
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SkyButton(
              text: 'Simpan Perubahan',
              textColor: Colors.white,
              onPressed: () {
                if (controller.formKeyChangePassword.currentState!.validate()) {
                  controller.requestChangePassword();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
