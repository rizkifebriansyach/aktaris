import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/core/database/secure_storage/secure_storage_manager.dart';
import 'package:aktaris_app/core/extension/string_extension.dart';
import 'package:aktaris_app/data.dart';
import 'package:aktaris_app/presentation/ui/home/home_controller.dart';
import 'package:aktaris_app/presentation/ui/notaris/notaris_page.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:upgrader/upgrader.dart';

import '../../../core/helper/permission_helper.dart';

class HomePage extends GetView<HomeController> {
  static String routeName = '/home';
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    PermissionHelper.isStorageGranted();
    PermissionHelper.isCameraGranted();
    var heightBottomNavbar =  kBottomNavigationBarHeight + 10;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: UpgradeAlert(
          showIgnore: false,
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height - heightBottomNavbar,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 225,
                      child: Column(
                        children: [
                          Container(
                            color: AppColors.primary,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.user?.user?.email ??
                                              'Hi, User',
                                          style: AppStyle.body1.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on_rounded,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              'Tebet, Jakarta',
                                              style: AppStyle.body1.copyWith(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      'assets/icons/notifications_active.png',
                                      width: 40,
                                    ),
                                  ],
                                ),
                                CarouselSlider.builder(
                                    itemCount: 1,
                                    options: CarouselOptions(
                                        aspectRatio: 1.0,
                                        initialPage: 0,
                                        viewportFraction: 1,
                                        enlargeCenterPage: false,
                                        height: 120),
                                    itemBuilder:
                                        (context, itemIndex, pageViewIndex) {
                                      return Container(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 15),
                                              child: Container(
                                                width: 45.w,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Text(
                                                        "Discount 15%",
                                                        style: AppStyle.subtitle3
                                                            .copyWith(
                                                                color:
                                                                    Colors.white),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Gunakan Kode Promo',
                                                      style: AppStyle.subtitle4
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    Text(
                                                      'AKTARISNOV11',
                                                      style: AppStyle.subtitle3
                                                          .copyWith(
                                                              color: Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Image.asset(
                                              'assets/images/young_man_image.png',
                                              width: 35.w,
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 61,
                      left: 20,
                      child: SmoothPageIndicator(
                        controller: controller.dotController,
                        count: 4,
                        effect: ExpandingDotsEffect(
                            dotHeight: 5,
                            dotWidth: 5,
                            activeDotColor: Colors.white,
                            dotColor: Colors.grey.shade400),
                      ),
                    ),
                    Positioned(
                      top: 175,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SearchBar(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          hintText: 'Cari notaris atau layanan',
                          hintStyle: const MaterialStatePropertyAll(
                              TextStyle(color: Colors.grey)),
                          leading: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            Get.toNamed(NotarisPage.routeName);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            walletItem(
                                image: 'assets/icons/wallet_icon.png',
                                title: 'Saldo',
                                saldo: ''.toIDR(amount: 1200000)),
                            walletItem(
                                image: 'assets/icons/coin_icon.png',
                                title: 'Total Konsultasi',
                                saldo: '420.000'),
                            // walletItem(
                            //     image: 'assets/icons/ticket_icon.png',
                            //     title: 'Promo',
                            //     saldo: '20 Kupon'),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Kategori Konsultasi",
                          style: AppStyle.body1.copyWith(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        categoryItem(),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Notaris Online",
                              style: AppStyle.body1.copyWith(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(NotarisPage.routeName);
                              },
                              child: Text(
                                'Lihat Semua',
                                style: AppStyle.body1.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          // padding: const EdgeInsets.all(10),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: newActivityWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
                                decoration: BoxDecoration(
                                    color:
                                        (controller.activeIndex.value == index)
                                            ? AppColors.primary
                                            : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  children: [
                                    Image.asset(paymentChannel[index]['image']),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            paymentChannel[index]['title'],
                                            style: AppStyle.body1.copyWith(
                                                color: (controller.activeIndex
                                                            .value ==
                                                        index)
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                          Text(
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
                                          )
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
                                ''.toIDR(amount: controller.totalPrice.value),
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
                          onPressed: () {},
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

  Widget newActivityWidget() {
    return ListView.separated(
      separatorBuilder: (context, index) => Container(
        width: 10,
      ),
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(7),
          width: 300,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/images/user1_image.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Rian Kumala',
                    style: AppStyle.body1.copyWith(color: Colors.white),
                  ),
                  Text(
                    'Notaris',
                    style: AppStyle.body2.copyWith(color: Colors.white),
                  ),
                 
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.work_outline,
                              color: Colors.black,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              '5 Tahun',
                              style: AppStyle.body3.copyWith(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                         padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 4),
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
                              style: AppStyle.body3.copyWith(color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Flexible(
                flex: 3,
                child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset('assets/icons/chats_icon.png')),
              )
            ],
          ),
        );
      },
    );
  }

  Widget categoryItem() {
    return GridView.builder(
      itemCount: dataCategory.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 15,
        childAspectRatio: 0.9,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () async {
            var token = await SecureStorageManager.find.getToken();
            debugPrint("TOKEN HOME : $token");
            return (dataCategory[index]['title'] != 'Lainnya')
                ? bottomSheet(Get.context!, dataCategory[index]['image'],
                    dataCategory[index]['title'])
                : null;
          },
          child: Container(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: Colors.white,
                  elevation: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 0.7, color: Colors.grey)),
                    child: Image.asset(dataCategory[index]['image'], width: 50),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Flexible(
                  child: Text(
                    dataCategory[index]['title'],
                    style:
                        AppStyle.body3.copyWith(fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget walletItem({
    required String image,
    required String title,
    required String saldo,
  }) {
    return Row(
      children: [
        Image.asset(image),
        const SizedBox(
          width: 7,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyle.body3.copyWith(color: Colors.grey),
            ),
            Text(
              saldo,
              style: AppStyle.body2
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }
}
