// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/core/extension/string_extension.dart';
import 'package:aktaris_app/presentation/ui/firsttest/listtransaksi_page.dart';
import 'package:aktaris_app/presentation/ui/transaction/transaction_controller.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../widget/custom_appbar.dart';

class TransactionPage extends GetView<TransactionController> {
  static String routeName = '/transaction';
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.role.value = 'user';
    return DefaultTabController(
      length: (controller.role.value == 'notaris') ? 3 : 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: SkyAppBar.primary(
            centerTitle: true,
            title: 'Transaksi',
            titleStyle: const TextStyle(
                color: Colors.black, fontFamily: "Poppins", fontSize: 18),
            bottom: TabBar(
              indicatorColor: AppColors.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: (controller.role.value == 'notaris')
                  ? [
                      Tab(
                        child: Text(
                          'Daftar Tunggu',
                          style: AppStyle.body2.copyWith(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Berjalan',
                          style: AppStyle.body2.copyWith(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Riwayat',
                          style: AppStyle.body2.copyWith(color: Colors.black),
                        ),
                      ),
                    ]
                  : [
                      Tab(
                        child: Text(
                          'Pesanan',
                          style: AppStyle.body2.copyWith(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Riwayat',
                          style: AppStyle.body2.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
            ),
          ),
        ),
        body: TabBarView(
          children: (controller.role.value == 'notaris')
              ? [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Daftar Tunggu",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppin',
                                fontWeight: FontWeight.w400)),
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/images/transaksi1.png',
                          height: 100,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Belum Ada Customer",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppin',
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          "Coba, cek lagi ya nanti!",
                          style: TextStyle(fontSize: 14, fontFamily: 'Poppin'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Daftar Pesanan",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppin',
                                fontWeight: FontWeight.w400)),
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/images/transaksi1.png',
                          height: 100,
                        ),
                        const SizedBox(height: 20),
                        Text("Belum Ada Pesanan",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppin',
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 7),
                        Text("Coba, cek lagi ya nanti!",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppin',
                            )),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Daftar Riwayat",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppin',
                                fontWeight: FontWeight.w400)),
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/images/transaksi2.png',
                          height: 100,
                        ),
                        const SizedBox(height: 20),
                        Text("Belum Ada Riwayat Transaksi",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppin',
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 7),
                        Text("Coba, cek lagi ya nanti!",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppin',
                            )),
                      ],
                    ),
                  ),
                ]
              : [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Daftar Pesanan",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppin',
                                fontWeight: FontWeight.w400)),
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/images/transaksi1.png',
                          height: 100,
                        ),
                        const SizedBox(height: 20),
                        Text("Belum Ada Pesanan",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppin',
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 7),
                        Text("Yuk, mulai konsultasi untuk buat Akta",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppin',
                            )),
                        Text("dengan mudah",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppin',
                            )),
                        const SizedBox(height: 20),
                        SkyButton(
                            text: 'Mulai Konsultasi',
                            textColor: Colors.white,
                            onPressed: null,
                            margin: EdgeInsets.symmetric(
                                horizontal: 120, vertical: 10)),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: SkyButton(
                            text: 'Test List Transaksi',
                            textColor: Colors.white,
                            margin: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                            onPressed: () {
                              Get.toNamed(listtransaksiPage.routeName);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => (controller.responseListNotaris.length > 1)
                        ? listPesanan()
                        : Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Daftar Riwayat",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Poppin',
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(height: 20),
                                Image.asset(
                                  'assets/images/transaksi2.png',
                                  height: 100,
                                ),
                                const SizedBox(height: 20),
                                Text("Belum Ada Riwayat Transaksi",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppin',
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 7),
                                Text("Yuk, mulai konsultasi untuk buat Akta",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppin',
                                    )),
                                Text("dengan mudah",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppin',
                                    )),
                                const SizedBox(height: 20),
                                SkyButton(
                                    text: 'Mulai Konsultasi',
                                    textColor: Colors.white,
                                    onPressed: null,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 120, vertical: 10)),
                              ],
                            ),
                          ),
                  ),
                ],
        ),
      ),
    );
  }

  Widget listPesanan() {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      padding: EdgeInsets.all(10),
      child: ListView.separated(
        separatorBuilder: (context, length) => const SizedBox(
          height: 10,
        ),
        itemCount: controller.responseListNotaris.length,
        itemBuilder: ((context, index) {
          Color statusColor = controller.getStatusColor(
              controller.responseListNotaris[index].paymentStatus!);
          Color statusTextColor = controller.getStatusTextColor(
              controller.responseListNotaris[index].paymentStatus!);
          String statusPayment = controller.convertStatusValue(
              controller.responseListNotaris[index].paymentStatus!);
          var createdAt =
              controller.responseListNotaris[index].createAt.toString();
          var _createdAt = DateTime.parse(createdAt).toLocal();
          // Initialize the date format with the desired pattern
          var dateFormat = DateFormat('d MMMM yyyy - HH.mm').format(_createdAt);
          return InkWell(
            borderRadius: BorderRadius.circular(15),          
            onTap: () {},
            child: Card(
              color: Colors.white,
              elevation: 2,
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    ProfilePicture(
                        name: controller.responseListNotaris[index].name ??
                            "User",
                        radius: 30,
                        fontsize: 14),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(dateFormat, style: AppStyle.body3),
                                    Text(
                                        controller.responseListNotaris[index]
                                                .name ??
                                            "User",
                                        style: AppStyle.body1),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: statusColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(statusPayment ?? "-",
                                    style: AppStyle.body2
                                        .copyWith(color: statusTextColor)),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Kategori: ${controller.responseListNotaris[index].productName}",
                                      style: AppStyle.body3),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.thumb_up_outlined,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          '100 %',
                                          style: AppStyle.body3
                                              .copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Total Pembayaran",
                                    style: AppStyle.body3,
                                  ),
                                  Text(
                                    "".toIDR(
                                        amount: controller
                                            .responseListNotaris[index]
                                            .subTotalFee!),
                                    style: AppStyle.body2
                                        .copyWith(color: statusTextColor),
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
              ),
            ),
          );
        }),
      ),
    );
  }
}
