import 'package:aktaris_app/presentation/ui/firsttest/privacy_page.dart';
import 'package:aktaris_app/presentation/ui/firsttest/syarat_ketentuan_page.dart';
import 'package:aktaris_app/presentation/ui/profile/setting/change_password/change_password_page.dart';
import 'package:aktaris_app/presentation/ui/profile/setting/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/app_style.dart';
import '../../../widget/custom_appbar.dart';

class SettingPage extends GetView<SettingController> {
  static String routeName = '/setting-page';
  const SettingPage({super.key});

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
        children: [
          profileImage(),
          Divider(
            color: Colors.grey.shade200,
            thickness: 7,
          ),
          profileData()
        ],
      ),
    );
  }

  Widget profileData() {
    return SizedBox(
      width: MediaQuery.of(Get.context!).size.width,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dataItem(
                    value: 'Ubah/Atur Kata Sandi',
                    onPressed: () {
                      Get.toNamed(ChangePasswordPage.routeName);
                    }),
                //for notaris
                // const Divider(),
                // dataItem(
                //     value: 'Ubah/Tambah Rekening Bank', onPressed: () {  }),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
                dataItem(
                    value: 'Syarat dan Ketentuan',
                    onPressed: () {
                     Get.toNamed(syaratKetentuanPage.routeName);
                    }),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
                dataItem(value: 'Kebijakan Privasi', onPressed: () {
                  Get.toNamed(privacyPage.routeName);
                }),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dataItem({required String value, required VoidCallback onPressed}) {
    return SizedBox(
      child: InkWell(
        onTap: () {
          onPressed();
        },
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: AppStyle.body2.copyWith(
                  color: Colors.black,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade600,
                size: 17,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget profileImage() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                const Stack(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/user1_image.png'),
                    ),
                    //for notaris
                    // Positioned(
                    //   bottom: 0,
                    //   right: 3,
                    //   child: Icon(
                    //     Icons.circle,
                    //     color: AppColors.primary,
                    //     size: 15,
                    //   ),
                    // )
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Joko Sasongko',
                      style: AppStyle.body1.copyWith(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Row(
                      children: [
                        // const Icon(
                        //   Icons.location_on_rounded,
                        //   size: 15,
                        //   color: AppColors.primary,
                        // ),
                        Text(
                          'ID User: ',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '000001',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
