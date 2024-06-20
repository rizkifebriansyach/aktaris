import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/core/database/shared_prefs.dart';
import 'package:aktaris_app/core/extension/string_extension.dart';
import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/presentation/ui/auth/login/login_page.dart';
import 'package:aktaris_app/presentation/ui/profile/profile_controller.dart';
import 'package:aktaris_app/presentation/ui/profile/personal_data/personal_data_page.dart';
import 'package:aktaris_app/presentation/ui/profile/mitra_notaris/mitra_notaris_page.dart';
import 'package:aktaris_app/presentation/ui/profile/setting/setting_page.dart';
// import 'package:aktaris_app/presentation/ui/profile/personal_document/personal_document_page.dart';
import 'package:aktaris_app/presentation/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_style.dart';

class ProfilePage extends GetView<ProfileController> {
  static String routeName = '/profile';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SkyAppBar.primary(
          centerTitle: true,
          title: 'Profil',
          titleStyle: const TextStyle(
              color: Colors.black, fontFamily: "Poppins", fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              //* Profile Image
              profileImage(),
              //* E-Wallet
              eWalletProfile(),
              Divider(
                color: Colors.grey.shade200,
                thickness: 5,
              ),
              Expanded(child: profileMenu())
            ],
          ),
        ),
      ),
    );
  }

  Widget profileMenu() {
    return SizedBox(
      width: MediaQuery.of(Get.context!).size.width,
      child: Column(
        children: [
          Container(
            // padding: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
            child: Column(
              children: [
                Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {
                        Get.toNamed(PersonalDataPage.routeName);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: Colors.grey.shade800,
                              size: 27,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              "Data Pribadi",
                              style:
                                  AppStyle.body2.copyWith(color: Colors.black),
                            )),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.shade800,
                              size: 17,
                            )
                          ],
                        ),
                      ),
                    ),
                    // const Divider(),
                    Divider(
                      color: Colors.grey.shade200,
                      thickness: 1,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {
                        Get.toNamed(
                          MitraNotarisPage.routeName,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.hub,
                              color: Colors.grey.shade800,
                              size: 27,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              "Mitra Notaris",
                              style:
                                  AppStyle.body2.copyWith(color: Colors.black),
                            )),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.shade800,
                              size: 17,
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                      thickness: 1,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {
                        Get.toNamed(SettingPage.routeName);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings,
                              color: Colors.grey.shade800,
                              size: 27,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              "Pengaturan",
                              style:
                                  AppStyle.body2.copyWith(color: Colors.black),
                            )),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.shade800,
                              size: 17,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade200,
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                // ignore: void_checks
                return DialogHelper.warning(
                  title: "Perhatian!",
                    message: "Apakah anda yakin ingin keluar akun?",
                    onConfirm: () {
                      LocalStorage.to.logout();
                      prefs.setBool(KeyPrefs.isLoggedIn, false);
                      Get.offAllNamed(LoginPage.routeName);
                    });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout_rounded,
                      color: Colors.grey.shade800,
                      size: 27,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "Keluar Akun",
                        style: AppStyle.body2.copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Aktaris",
                  style: AppStyle.body2.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Versi 1.0 - 2024",
                  style: AppStyle.body2.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget profileImage() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Stack(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/images/user1_image.png'),
                  ),
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
              const SizedBox(width: 15),
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
        ],
      ),
    );
  }

  Widget eWalletProfile() {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 1),
      margin: const EdgeInsets.only(right: 55),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              const SizedBox(
                height: 55,
                child: VerticalDivider(
                  color: AppColors.primary,
                  thickness: 1.7,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset("assets/icons/wallet_icon.png"),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Saldo",
                    style: AppStyle.body2.copyWith(color: Colors.grey),
                  ),
                  Text(
                    "".toIDR(amount: 1200000),
                    style: AppStyle.body1,
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                height: 55,
                child: VerticalDivider(
                  color: AppColors.primary,
                  thickness: 1.3,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset("assets/icons/coin_icon.png"),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Konsultasi",
                    style: AppStyle.body2.copyWith(color: Colors.grey),
                  ),
                  Text(
                    "0",
                    style: AppStyle.body1,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
