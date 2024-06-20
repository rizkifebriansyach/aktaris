import 'package:aktaris_app/presentation/ui/profile/personal_data/change_personal_data/change_personaldata_page.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';

import '../../../../config/theme/app_style.dart';
import '../../../widget/custom_appbar.dart';
import 'personal_data_controller.dart';

class PersonalDataPage extends GetView<PersonalDataController> {
  static String routeName = "/personal-data";
  const PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SkyAppBar.primary(
          centerTitle: true,
          title: 'Data Pribadi',
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
          Expanded(child: profileData()),
        ],
      ),
    );
  }

  Widget profileData() {
    return  SizedBox(
        child: ListView.builder(
            itemCount: 1,
            shrinkWrap: false,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(3),
                  child: Obx(
                    () =>Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        dataItem(title: 'Nama Lengkap', value: controller.userDetail.value?.user?.userDetail?.name ?? "-"),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        dataItem(title: 'Tempat Lahir', value: controller.userDetail?.value?.user?.userDetail?.placeOfBirth ?? "-"),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        dataItem(title: 'Tanggal Lahir', value: controller.userDetail?.value?.user?.userDetail?.dateOfBirth ?? "-"),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        dataItem(title: 'Jenis Kelamin', value: controller.userDetail?.value?.user?.userDetail?.gender ?? "-"),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        dataItem(title: 'NIK', value: controller.userDetail?.value?.user?.userDetail?.noNik ?? "-"),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        dataItem(title: 'NPWP', value: controller.userDetail?.value?.user?.userDetail?.noNpwp ?? "-"),
                        const SizedBox(height: 9,),
                        Divider(
                          color: Colors.grey.shade200,
                          thickness: 7,
                        ),
                        const SizedBox(height: 9,),
                        dataItem(
                          title: 'Status Pernikahan', value: controller.userDetail?.value?.user?.userDetail?.marriageStatus ?? "-"),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        dataItem(title: 'Agama', value: controller.userDetail?.value?.user?.userDetail?.agama ?? "-"),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        dataItem(title: 'Nama Ibu Kandung', value: controller.userDetail?.value?.user?.userDetail?.ibuKandung ?? "-"),
                              //for notaris
                              // const Divider(),
                              // dataItem(title: 'Nomor Rekening', value: '12341552'),
                              // const Divider(),
                      ],
                    ),
                  ),
                ),
              );
            }),
      
    );
  }

  Widget dataItem({required String title, required String value}) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle.body3.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            value,
            style: AppStyle.body2.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget profileImage() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Obx(
        ()=> Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                   Stack(
                    children: [
                       ProfilePicture(
                        name: controller.userDetail.value?.user?.userDetail?.name ?? "User",
                        radius: 30,
                        fontsize: 14),
                      // CircleAvatar(
                      //   radius: 30,
                      //   backgroundImage:
                      //       AssetImage('assets/images/user1_image.png'),
                      // ),
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
                        controller.userDetail.value?.user?.userDetail?.name ?? "User",
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
            SkyButton(
                width: 90,
                height: 40,
                text: "Ubah",
                fontSize: 12,
                borderRadius: BorderRadius.circular(9),
                textColor: Colors.white,
                onPressed: () {
                  Get.toNamed(ChangePersonalDataPage.routeName);
                })
          ],
        ),
      ),
    );
  }
}
