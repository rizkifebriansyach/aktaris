import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/core/extension/string_extension.dart';
import 'package:aktaris_app/presentation/ui/transaction/payment/detail_payment_controller.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/custom_appbar.dart';

class DetailPaymentPage extends GetView<DetailPaymentController> {
  static String routeName = '/detail-payment';
  const DetailPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: SkyAppBar.primary(
            centerTitle: true,
            title: 'Pembayaran',
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
        body: bankPayment());
    // Obx(() => (controller.paymentType.value == "gopay")
    //     ? gopayPayment()
    //     : bankPayment()));
  }

  Widget bankPayment() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(Get.context!).size.width,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Batas Akhir Pembayaran',
                      style:
                          AppStyle.body1.copyWith(color: Colors.grey.shade600),
                    ),
                    Obx(() {
                      switch (controller.paymentStatus.value) {
                        case 'unpaid':
                          return Text(
                            "Belum Bayar",
                            style: AppStyle.body2.copyWith(color: Colors.red),
                          );
                        case 'pending':
                          return Text(
                            "Menunggu Pembayaran",
                            style: AppStyle.body2
                                .copyWith(color: Colors.red, fontSize: 10),
                          );
                        case 'failed':
                          return Text(
                            "Gagal",
                            style: AppStyle.body2.copyWith(color: Colors.red),
                          );
                        case 'success':
                          return Text(
                            "Berhasil",
                            style: AppStyle.body2.copyWith(color: Colors.green),
                          );
                        default:
                          return const Text("");
                      }
                    })
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.expiredAt.value!,
                      style:
                          AppStyle.body1.copyWith(fontWeight: FontWeight.bold),
                    ),
                   Obx(
                      () => Text((controller.expiredAt.value != null)?
                        '${controller.minutes.value} : ${controller.seconds.value.toString().padLeft(2, '0')}':"00 : 00",
                        style: AppStyle.body1.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade100,
            thickness: 5,
          ),
          Container(
            width: MediaQuery.of(Get.context!).size.width,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mandiri VA',
                      style:
                          AppStyle.body1.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Obx(() => (controller.paymentType.value == "mandiri")
                        ? Image.asset("assets/images/mandiri.png")
                        : Image.asset("assets/images/mandiri.png"))
                  ],
                ),
                const Divider(),
                Text(
                  'Biller Code',
                  style: AppStyle.body1.copyWith(color: Colors.grey.shade600),
                ),
                Text(
                  '70012',
                  style: AppStyle.body1.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'VA Number',
                  style: AppStyle.body1.copyWith(color: Colors.grey.shade600),
                ),
                 Obx(
                  () => Text(
                    controller.billerKey.value!,
                    style: AppStyle.body1.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Total Pembayaran',
                  style: AppStyle.body1.copyWith(color: Colors.grey.shade600),
                ),
                Text(
                  ''.toIDR(amount: controller.totalPayment.value!.toDouble()),
                  style: AppStyle.body1.copyWith(fontWeight: FontWeight.bold),
                ),
                const Divider(),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Transaksi Saya',
                      style: AppStyle.body1.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade100,
            thickness: 5,
          ),
          Container(
            width: MediaQuery.of(Get.context!).size.width,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cara Pembayaran',
                  style: AppStyle.headline4.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mandiri VA',
                      style: AppStyle.body1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Obx(() => (controller.paymentType.value == "mandiri")
                        ? Image.asset("assets/images/mandiri.png")
                        : Image.asset("assets/images/mandiri.png"))
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SkyButton(
                  text: "Konfirmasi Pembayaran",
                  textColor: Colors.white,
                  onPressed: () {
                    controller.checkPaymentStatus();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget gopayPayment() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(Get.context!).size.width,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Batas Akhir Pembayaran',
                  style: AppStyle.body1.copyWith(color: Colors.grey.shade600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rabu, 22 Jun 2022 23:57 WIB',
                      style:
                          AppStyle.body1.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Obx(
                      () => Text(
                        '${controller.minutes.value} : ${controller.seconds.value.toString().padLeft(2, '0')}',
                        style: AppStyle.body1.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade100,
            thickness: 5,
          ),
          Container(
            width: MediaQuery.of(Get.context!).size.width,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Mandiri VA',
                      style:
                          AppStyle.body1.copyWith(fontWeight: FontWeight.bold),
                    )
                    // Image.asset(name)
                  ],
                ),
                const Divider(),
                Text(
                  'Biller Code',
                  style: AppStyle.body1.copyWith(color: Colors.grey.shade600),
                ),
                Text(
                  '70012',
                  style: AppStyle.body1.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'VA Number',
                  style: AppStyle.body1.copyWith(color: Colors.grey.shade600),
                ),
                Obx(
                  () => Text(
                    controller.billerKey.value!,
                    style: AppStyle.body1.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Total Pembayaran',
                  style: AppStyle.body1.copyWith(color: Colors.grey.shade600),
                ),
                Text(
                  ''.toIDR(amount: 35000),
                  style: AppStyle.body1.copyWith(fontWeight: FontWeight.bold),
                ),
                const Divider(),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Transaksi Saya',
                      style: AppStyle.body1.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade100,
            thickness: 5,
          ),
          Container(
            width: MediaQuery.of(Get.context!).size.width,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cara Pembayaran',
                  style: AppStyle.headline4.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mandiri',
                      style: AppStyle.body1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
