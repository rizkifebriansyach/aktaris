import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/presentation/ui/firsttest/listtransaksi_page.dart';
import 'package:aktaris_app/presentation/ui/profile/mitra_notaris/mitra_notaris_controller.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:aktaris_app/core/extension/string_extension.dart';
import 'package:aktaris_app/domain/entities/notaris_list_entity.dart';
import 'package:aktaris_app/presentation/ui/notaris/notaris_controller.dart';
import 'package:get/get.dart';

import '../../../widget/custom_appbar.dart';

class MitraNotarisPage extends GetView<MitraNotarisController> {
  static String routeName = '/mitra-notaris';
  const MitraNotarisPage({super.key});
  final String texting =
      """Bergabunglah menjadi mitra Notaris
      melalui aplikasi "Aktaris" dan temukan peluang untuk berinteraksi langsung dengan pengguna, memberikan konsultasi hukum pertanahan secara langsung, dan memberikan solusi legal yang akurat. Ayo bergabung sekarang dan jadilah bagian dari revolusi layanan hukum yang lebih mudah dijangkau.""";

  @override
  Widget build(BuildContext context) {
    controller.role.value = 'user';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SkyAppBar.primary(
          centerTitle: true,
          title: 'Mitra Notaris',
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hallo!', style: AppStyle.body1.copyWith(fontSize: 16)),
          // ${controller.responseListNotaris.value[index].notarisDetails!.name!}
          Text('Apakah kamu seorang notaris?', style: AppStyle.body1.copyWith(fontSize: 16)),
          Image.asset('assets/images/mitra_notariss.jpg', height: 350,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                texting, 
                textAlign: TextAlign.center,
                style: AppStyle.body1.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 16
                )
              ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SkyButton(
              text: 'Daftar Mitra Notaris',
              textColor: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              onPressed: () {
                // Get.toNamed(listtransaksiPage.routeName);
              },
            ),
          ),          
        ],
      ),
    );
  }
}
