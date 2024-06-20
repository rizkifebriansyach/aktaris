import 'package:aktaris_app/presentation/ui/profile/personal_document/personal_document_controller.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_style.dart';
import '../../../widget/custom_appbar.dart';

class PersonalDocPage extends GetView<PersonalDocController> {
  static String routeName = '/personal-doc';
  const PersonalDocPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.role.value = 'user';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SkyAppBar.primary(
          centerTitle: true,
          title: 'Dokumen Pribadi',
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
            color: Colors.grey.shade300,
            thickness: 5,
          ),
          Expanded(
              child: Obx(() => (controller.role.value == "notaris")
                  ? profileDataNotaris()
                  : profileDataUser())),
          // Padding(
          //   padding: const EdgeInsets.all(16),
          //   child: SkyButton(
          //     text: 'Unggah Dokumen',
          //     textColor: Colors.white,
          //     onPressed: () {},
          //   ),
          // )
        ],
      ),
    );
  }

  Widget profileDataNotaris() {
    return SizedBox(
      width: MediaQuery.of(Get.context!).size.width,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dataItem(title: 'KTP', value: 'Kartu Tanda Penduduk'),
                const Divider(),
                dataItem(
                    title: 'SK Pengangkatan',
                    value: 'Surat Keterangan Pengangkatan'),
                const Divider(),
                dataItem(title: 'NPWP', value: 'Nomor Pokok Wajib Pajak'),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget profileDataUser() {
    return SizedBox(
      width: MediaQuery.of(Get.context!).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  dataItem(title: 'KTP', value: 'Kartu Tanda Penduduk'),
                  const Divider(),
                  dataItem(title: 'NPWP', value: 'Nomor Pokok Wajib Pajak'),
                  const Divider(),
                  dataItem(title: 'KK', value: 'Kartu Keluarga'),
                  const Divider(),
                  dataItem(title: 'Buku Nikah', value: 'Surat Nikah/Buku Nikah'),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 5,
                  ),
                  dataItem(title: 'Sertifikat Tanah', value: 'Sertifikat Tanah'),
                  const Divider(),
                  dataItem(
                      title: 'SPPT PBB',
                      value: 'Surat Pemberitahuan Pembayaran Pajak PBB'),
                  const Divider(),
                  dataItem(title: 'STTS', value: 'Surat Tanda Terima Setoran'),
                  const Divider(),
                  dataItem(title: 'IMB', value: 'Izin Mendirikan Bangunan'),
                  const Divider(),
                  dataItem(
                      title: 'Bukti Pembayaran',
                      value: 'Listrik, Telpon, dan Air'),
                  const Divider(),
                  dataItem(title: 'Hipotik', value: 'Surat Roya'),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dataItem({required String title, required String value}) {
    return SizedBox(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyle.body3.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    value,
                    style: AppStyle.body2.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade600,
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
                    Positioned(
                      bottom: 0,
                      right: 3,
                      child: Icon(
                        Icons.circle,
                        color: AppColors.primary,
                        size: 15,
                      ),
                    )
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
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          size: 15,
                          color: AppColors.primary,
                        ),
                        Text(
                          'Tebet, Jakarta',
                          style:
                              AppStyle.body2.copyWith(color: AppColors.primary),
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
