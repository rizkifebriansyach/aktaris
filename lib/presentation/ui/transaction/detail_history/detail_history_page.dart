import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/core/extension/string_extension.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_history/detail_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';

import '../../../widget/custom_appbar.dart';

class DetailHistoryPage extends GetView<DetailHistoryController> {
  static String routeName = '/detail-history';
  const DetailHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SkyAppBar.primary(
          centerTitle: true,
          title: 'Rincian Konsultasi',
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
      body: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.asset(
              "assets/images/Check.png",
              width: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Pembayaran Berhasil",
              style: AppStyle.subtitle4.copyWith(color: Colors.black),
            ),
            Text(
              "".toIDR(amount: 50000),
              style: AppStyle.subtitle4.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 20),
            cardProfile(),
            const SizedBox(height: 20),
            orderDetail(),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primary.withOpacity(0.2)
              ),
              child: Row(
                children: [
                 const Icon(Icons.warning_rounded, color: AppColors.primary,),
                 const SizedBox(width: 5,),
                 Flexible(child: Text("Struk ini dapat dijadikan sebagai bukti pembayaran yang sah",style: AppStyle.body2,))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        itemComponent(
            title: "Status",
            value: "Berhasil",
            color: AppColors.primary,
            fontWeight: FontWeight.bold),
        itemComponent(title: "Metode Pembayaran", value: "Gopay"),
        itemComponent(title: "ID Transaksi", value: "ID-00123"),
        Text(
          "Rincian Pembayaran",
          style: AppStyle.body1.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        itemComponent(
          title: "Biaya Konsultasi 30 Menit",
          value: "".toIDR(amount: 30000),
        ),
        itemComponent(
          title: "Biaya Layanan",
          value: "".toIDR(amount: 5000),
        ),
        itemComponent(
          title: "Diskon Pengguna Baru",
          value: "-${''.toIDR(amount: 10000)}",
        ),
        itemComponent(
            title: "Total Pembayaran",
            value: "".toIDR(amount: 300000),
            fontWeight: FontWeight.bold),
      ],
    );
  }

  Widget itemComponent(
      {required String title,
      required String value,
      FontWeight? fontWeight,
      Color? color}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyle.body2.copyWith(fontWeight: fontWeight),
            ),
            Text(
              value,
              style: AppStyle.body2.copyWith(fontWeight: fontWeight, color: color),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget cardProfile() {
    return Card(
      child: Container(
        width: MediaQuery.of(Get.context!).size.width,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ProfilePicture(name: "User", radius: 30, fontsize: 14),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rizki Febriansyach",
                    style: AppStyle.body1.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Konsultasi 30 Menit",
                        style: AppStyle.body3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.primary.withOpacity(0.2)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 3),
                        child: Text(
                          "Kategori:Akta Jual Beli",
                          style:
                              AppStyle.body4.copyWith(color: AppColors.primary),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
