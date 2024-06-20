import 'package:aktaris_app/core/extension/string_extension.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_transaction/choose_session/choose_session_page.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_transaction/detail_transaction_controller.dart';
import 'package:aktaris_app/presentation/widget/custom_appbar.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_style.dart';
import '../../../../data.dart';

class DetailTransactionPage extends GetView<DetailTransactionController> {
  static String routeName = '/detail-transaction';
  const DetailTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(
        title: 'Rincian Konsultasi',
        centerTitle: true,
        titleStyle: const TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
          fontSize: 18,
        ),
      ),
      body: Column(
        children: [
          notarisDetail(),
          Expanded(child: detailPrice()),
          footerDetail(),
        ],
      ),
    );
  }

  Widget detailPrice() {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rincian Pembayaran',
                style: AppStyle.body1.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  controller.titleKonsultasi.value ??
                      'Biaya Konsultasi 30 Menit',
                  style: AppStyle.body2.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Biaya Layanan',
                style: AppStyle.body1.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Pajak',
                style: AppStyle.body1.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Promo Pengguna Baru',
                style: AppStyle.body2.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: false,
                child: Column(
                  children: [
                    Text(
                      'Poin',
                      style: AppStyle.body2.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Text(
                'Total Pembayaran',
                style: AppStyle.body1.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(ChooseSessionPage.routeName);
                },
                borderRadius: BorderRadius.circular(3),
                child: Row(
                  children: [
                    Text(
                      'Ubah Sesi Konsultasi',
                      style: AppStyle.body3.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  ''.toIDR(amount: controller.priceKonsultasi.value),
                  style: AppStyle.body1.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  ''.toIDR(amount: controller.biayaLayanan.value),
                  style: AppStyle.body1.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  ''.toIDR(amount: controller.taxFee.value),
                  style: AppStyle.body1.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  '- ${''.toIDR(amount: controller.discount.value)}',
                  style: AppStyle.body1.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: false,
                child: Column(
                  children: [
                    Text(
                      'Poin',
                      style: AppStyle.body1.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Obx(
                () => Text(
                  ''.toIDR(amount: controller.totalPayment.value ?? 0),
                  style: AppStyle.body1.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget notarisDetail() {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ProfilePicture(
              name: controller.detailData.notarisDetails!.name!,
              radius: 30,
              fontsize: 14),
          // CircleAvatar(
          //   radius: 30,
          //   backgroundImage: AssetImage(controller.detailData?['image']),
          // ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.detailData.notarisDetails!.name!,
                      style: AppStyle.body1.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 80,
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.primary.withOpacity(0.4),
                                  width: 1.2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.work_outline,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                controller
                                    .detailData.notarisDetails!.pengalaman!,
                                style: AppStyle.body3
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          height: 25,
                          width: 150,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              border: Border.all(color: AppColors.primary),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              'Kategori: Akta Jual Beli',
                              style: AppStyle.body4.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                const Divider(
                  height: 5,
                  thickness: 0.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> bottomSheet(
      BuildContext context, String image, String title) async {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              width: MediaQuery.of(Get.context!).size.width,
              height: MediaQuery.of(Get.context!).size.height - kToolbarHeight,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Checkout',
                        style: AppStyle.headline4.copyWith(color: Colors.black),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.grey,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Row(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              color: Colors.white,
                              elevation: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 0.7, color: Colors.grey)),
                                child: Image.asset(image, width: 50),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Text(
                                title,
                                style: AppStyle.body1
                                    .copyWith(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        '|',
                        style: TextStyle(fontSize: 30),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: AppColors.primary,
                          ),
                          Text(
                            'Tebet, Jakarta',
                            style: AppStyle.body1
                                .copyWith(color: AppColors.primary),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Metode Pembayaran',
                    style: AppStyle.headline4.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, length) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: paymentChannel.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    controller.paymentType =
                                        paymentChannel[index]["title"];
                                    controller.activeIndex.value = index;
                                    controller.totalPrice.value =
                                        paymentChannel[index]['saldo'];
                                    controller.disabled.value = true;
                                    debugPrint(
                                        controller.disabled.value.toString());
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                height: 70,
                                decoration: BoxDecoration(
                                    color:
                                        (controller.activeIndex.value == index)
                                            ? AppColors.primary
                                            : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(paymentChannel[index]['image']),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            paymentChannel[index]['title']
                                                .toString()
                                                .toUpperCase(),
                                            style: AppStyle.body1.copyWith(
                                                color: (controller.activeIndex
                                                            .value ==
                                                        index)
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                          Obx(
                                            (){
                                              var saldo = 0.obs;
                                              saldo.value = paymentChannel[index]['saldo'];
                                              return Visibility(
                                              visible: (saldo.value !=  0)? true : false,
                                              child: Text(
                                                ''.toIDR(
                                                    amount: paymentChannel[index]
                                                        ['saldo']),
                                                style: AppStyle.body1.copyWith(
                                                    color: (controller.activeIndex
                                                                .value ==
                                                            index)
                                                        ? Colors.white
                                                        : Colors.black),
                                              ),
                                            );
                                            }
                                          ),
                                        ],
                                      ),
                                    ),
                                    (paymentChannel[index]['active'] == true &&
                                            controller.activeIndex.value ==
                                                index)
                                        ? Align(
                                            alignment:
                                                AlignmentDirectional.centerEnd,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.check_circle,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        : Visibility(
                                            visible: (paymentChannel[index]
                                                        ['active'] ==
                                                    true)
                                                ? false
                                                : true,
                                            child: Align(
                                              alignment: AlignmentDirectional
                                                  .centerEnd,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.add_circle),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Biaya Konsultasi',
                            style: AppStyle.body1.copyWith(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                ''.toIDR(
                                    amount: controller.totalPayment.value!),
                                style: AppStyle.headline4.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(5),
                                onTap: () {},
                                child: Text(
                                  'detail',
                                  style: AppStyle.body2
                                      .copyWith(color: AppColors.primary),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Opacity(
                        opacity: (controller.disabled.value == false) ? 0.5 : 1,
                        child: SkyButton(
                          width: 150,
                          text: 'Konfirmasi',
                          textColor: Colors.white,
                          onPressed: () {
                            controller.requestPayment(controller.paymentType);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
        });
  }

  Widget footerDetail() {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(16),
        //   child: InkWell(
        //     borderRadius: BorderRadius.circular(20),
        //     onTap: () {
        //       controller.poinsIsActive.toggle();
        //     },
        //     child: Container(
        //       width: MediaQuery.of(Get.context!).size.width,
        //       padding: const EdgeInsets.all(16),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20),
        //         border: Border.all(color: AppColors.primary, width: 1),
        //       ),
        //       child: Row(
        //         children: [
        //           Image.asset("assets/icons/coin_icon.png"),
        //           const SizedBox(
        //             width: 15,
        //           ),
        //           Column(
        //             children: [
        //               Text(
        //                 "Poin",
        //                 style: AppStyle.body1.copyWith(color: Colors.black),
        //               ),
        //               Text("1000",
        //                   style: AppStyle.body1.copyWith(color: Colors.black))
        //             ],
        //           ),
        //           Expanded(child: Container()),
        //           Obx(
        //             () => Container(
        //               padding: const EdgeInsets.all(3),
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(100),
        //                   border: Border.all(
        //                       width: 2, color: Colors.grey.shade300)),
        //               child: Icon(
        //                 Icons.check,
        //                 size: 20,
        //                 color: controller.poinsIsActive.value
        //                     ? AppColors.primary
        //                     : Colors.transparent,
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        // Divider(
        //   thickness: 5,
        //   color: Colors.grey.shade300,
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(16),
        //   child: InkWell(
        //     onTap: () {},
        //     child: Container(
        //       width: MediaQuery.of(Get.context!).size.width,
        //       padding: const EdgeInsets.all(16),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20),
        //         border: Border.all(color: AppColors.primary, width: 1),
        //       ),
        //       child: Row(
        //         children: [
        //           Image.asset("assets/icons/ticket_icon.png"),
        //           const SizedBox(
        //             width: 15,
        //           ),
        //           // Text(
        //           //   "Kode Promo atau Referral",
        //           //   style: AppStyle.body1.copyWith(color: Colors.black),
        //           // ),
        //           // Expanded(child: Container()),
        //           // const Icon(
        //           //   Icons.arrow_forward_ios,
        //           //   size: 20,
        //           //   color: Colors.grey,
        //           // ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        Divider(
          thickness: 3,
          color: Colors.grey.shade300,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pembayaranmu",
                    style: AppStyle.body1.copyWith(color: Colors.black),
                  ),
                  Obx(
                    () => Text(
                      ''.toIDR(amount: controller.totalPayment.value ?? 0),
                      style: AppStyle.body1.copyWith(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SkyButton(
                  width: 150,
                  text: "Konfirmasi",
                  textColor: Colors.white,
                  fontSize: 14,
                  onPressed: () async {
                    controller.createTransaction();
                    await bottomSheet(Get.context!,
                        "assets/icons/agreement_icon.png", "Akta Jual Beli");
                  },
                ),
              
            ],
          ),
        )
      ],
    );
  }
}
