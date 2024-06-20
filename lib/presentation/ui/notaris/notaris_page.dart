import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/core/extension/string_extension.dart';
import 'package:aktaris_app/domain/entities/notaris_list_entity.dart';
import 'package:aktaris_app/presentation/ui/message/chat/chat_screen_page.dart';
import 'package:aktaris_app/presentation/ui/notaris/notaris_controller.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_transaction/detail_transaction_page.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';

class NotarisPage extends GetView<NotarisController> {
  static String routeName = '/notaris-list';
  const NotarisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(
          () => controller.isSearchOpen.value
              ? TextFormField(
                  cursorColor: AppColors.primary,
                  maxLines: 1,
                  controller: controller.searchController,
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primary)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.searchController.clear();
                        controller.filterItems();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                  onChanged: (value) {
                    controller.filterItems();
                  },
                )
              : Text(
                  "Notaris terbaik disekitarmu",
                  style: AppStyle.body1.copyWith(fontSize: 16),
                ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              controller.isSearchOpen.toggle();
              controller.filterItems();
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Container(
                      width: 150,
                      height: 26,
                      decoration: BoxDecoration(
                          color: controller.selectedValue.value != ""
                              ? const Color.fromARGB(255, 105, 223, 179)
                                  .withOpacity(0.15)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(2),
                          prefixIcon: Icon(
                            Icons.location_on_rounded,
                            size: 15,
                            color: controller.selectedValue.value != ""
                                ? AppColors.primary
                                : Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.primary),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        hint: Text(
                          controller.dataSortLocation[0].title!,
                          style: AppStyle.body3,
                        ),
                        value: controller.selectedSortLocation.value,
                        items: controller.dataSortLocation
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e.title!,
                                    style: AppStyle.body3,
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.selectedSortLocation.value = value;
                          controller.selectedValue.value = value!.value!;
                        },
                        selectedItemBuilder: (context) {
                          return controller.dataSortLocation.map((e) {
                            return DropdownMenuItem(
                                value: e.value,
                                child: Text(
                                  e.title!,
                                  style: AppStyle.body3
                                      .copyWith(color: AppColors.primary),
                                ));
                          }).toList();
                        },
                        onTap: () {
                          debugPrint(
                              controller.isDropdownActive.toggle().toString());
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Obx(
                    () => InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        controller.isOnlineSelected.toggle();
                        controller.filterItems();
                      },
                      child: Container(
                        height: 26,
                        width: 70,
                        decoration: BoxDecoration(
                            color: controller.isOnlineSelected.value == true
                                ? const Color.fromARGB(255, 105, 223, 179)
                                    .withOpacity(0.15)
                                : Colors.white,
                            border: Border.all(
                                color: controller.isOnlineSelected.value == true
                                    ? AppColors.primary
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            'Semua',
                            style: AppStyle.body3.copyWith(
                                color: controller.isOnlineSelected.value == true
                                    ? AppColors.primary
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Obx(
                    () => InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        controller.isOnlineSelected.toggle();
                        controller.filterItems();
                      },
                      child: Container(
                        height: 26,
                        width: 70,
                        decoration: BoxDecoration(
                            color: controller.isOnlineSelected.value == true
                                ? const Color.fromARGB(255, 105, 223, 179)
                                    .withOpacity(0.15)
                                : Colors.white,
                            border: Border.all(
                                color: controller.isOnlineSelected.value == true
                                    ? AppColors.primary
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            'Online',
                            style: AppStyle.body3.copyWith(
                                color: controller.isOnlineSelected.value == true
                                    ? AppColors.primary
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.sort_outlined,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          listNotaris()
        ],
      ),
      // body: DefaultTabController(
      //   initialIndex: 0,
      //   length: 4,
      //   child: Container(
      //     width: MediaQuery.of(context).size.width,
      //     decoration: BoxDecoration(
      //       border: Border.symmetric(
      //         horizontal: BorderSide(
      //           color: Colors.grey.shade300,
      //           width: 1.5,
      //         ),
      //       ),
      //     ),
      //     child: Padding(
      //       padding: const EdgeInsets.all(5),
      //       child: Column(
      //         children: [
      //           TabBar(
      //             controller: controller.tabController,
      //             labelPadding: const EdgeInsets.all(2),
      //             indicatorPadding: const EdgeInsets.all(3),

      //             // padding: EdgeInsets.all(5),
      //             indicatorSize: TabBarIndicatorSize.tab,
      //             indicator: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(15),
      //                 border: Border.all(color: AppColors.primary)),
      //             tabs: [
      //               Obx(() => DropdownButtonFormField(
      //                     decoration: InputDecoration(
      //                       prefixIcon: Icon(Icons.location_on_rounded,),
      //                         border: OutlineInputBorder(
      //                             borderRadius: BorderRadius.circular(15))),
      //                     hint: Text(controller.dataSortLocation[0].title!),
      //                     value: controller.selectedSortLocation.value,
      //                     items: controller.dataSortLocation
      //                         .map((e) => DropdownMenuItem(
      //                               value: e,
      //                               child: Text(
      //                                 e.title!,
      //                                 style: AppStyle.body3,
      //                               ),
      //                             ))
      //                         .toList(),
      //                     onChanged: (value) {
      //                       controller.selectedSortLocation.value = value;
      //                     },
      //                   )),
      //               Text('Semua'),
      //               Text('Terdekat'),
      //               Text('Online'),
      //             ],
      //           ),
      //           Expanded(
      //             child: TabBarView(children: [
      //               listNotaris(),
      //               Container(),
      //               Container(),
      //               Container(),
      //             ]),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Widget listNotaris() {
    return Obx(
      () => Expanded(
        child: SizedBox(
          child: ListView.builder(
            itemCount: controller.responseListNotaris.value.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(3),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ProfilePicture(
                              name: controller.responseListNotaris[index]
                                  .notarisDetails!.name!,
                              radius: 30,
                              fontsize: 14),
                          Positioned(
                            bottom: 0,
                            right: 3,
                            child: Icon(
                              Icons.circle,
                              color: controller.responseListNotaris.value[index]
                                          .onlineHistory?.active ==
                                      true
                                  ? AppColors.primary
                                  : Colors.red,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            //baris si joko dan detailnya
                            Row(
                              children: [
                                Expanded(
                                  //kolom nama + pengalaman
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.responseListNotaris
                                            .value[index].notarisDetails!.name!,
                                        style: AppStyle.body1.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 70,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 7),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColors.primary
                                                    .withOpacity(0.4),
                                                width: 1.2)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.work_outline,
                                              size: 13,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              controller
                                                  .responseListNotaris
                                                  .value[index]
                                                  .notarisDetails!
                                                  .pengalaman!,
                                              style: AppStyle.body4.copyWith(
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                                //kolom konsultasi+mulai+harga
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SkyButton(
                                      text: 'Konsultasi',
                                      fontSize: 13,
                                      textColor: Colors.white,
                                      width: 110,
                                      height: 25,
                                      borderRadius: BorderRadius.circular(50),
                                      color: controller
                                                  .responseListNotaris
                                                  .value[index]
                                                  .onlineHistory
                                                  ?.active ==
                                              true
                                          ? AppColors.primary
                                          : Colors.grey,
                                      onPressed: () {
                                        // var data;
                                        // controller
                                        //             .responseListNotaris
                                        //             .value[index]
                                        //             .onlineHistory
                                        //             ?.active ==
                                        //         true
                                        //     // ? bottomSheet(context,controller.responseListNotaris.value[index])
                                        //     ? Get.toNamed(
                                        //         DetailTransactionPage.routeName,
                                        //         arguments: data,
                                        //       )
                                        //     : null;
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 7, top: 4),
                                      child: Text(
                                        'Mulai dari',
                                        style: AppStyle.body4
                                            .copyWith(color: Colors.black),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 7),
                                      child: Text(
                                        ''.toIDR(
                                          amount: controller.responseListNotaris
                                              .value[index].price!.price!,
                                        ),
                                        style: AppStyle.body1.copyWith(
                                            color: AppColors.primary,
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              height: 2,
                              thickness: 0.5,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            //baris alamat
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: AppColors.primary,
                                  size: 13,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  controller.responseListNotaris.value[index]
                                      .notarisDetails!.city!,
                                  style: AppStyle.body4.copyWith(
                                    color: AppColors.primary,
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
                onTap: () {
                  controller.responseListNotaris.value[index].onlineHistory
                              ?.active ==
                          true
                      ? bottomSheet(
                          context, controller.responseListNotaris.value[index])
                      : null;
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> bottomSheet(BuildContext context, NotarisListEntity data) {
    // var controller = Get.find<NotarisController>();
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Profil Notaris",
                          style: AppStyle.body1.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      ProfilePicture(
                          name: data.notarisDetails!.name!,
                          radius: 30,
                          fontsize: 14),
                      // CircleAvatar(
                      //   radius: 30,
                      //   backgroundImage: AssetImage(data['image']),
                      // ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.notarisDetails!.name!,
                                        style: AppStyle.body1.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 80,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 7),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColors.primary
                                                    .withOpacity(0.4),
                                                width: 1.2)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.work_outline,
                                              size: 12,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              data.notarisDetails!.pengalaman!,
                                              style: AppStyle.body3.copyWith(
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SkyButton(
                                      text: 'Konsultasi',
                                      fontSize: 12,
                                      textColor: Colors.white,
                                      width: 110,
                                      height: 25,
                                      borderRadius: BorderRadius.circular(50),
                                      color: data.onlineHistory?.active == true
                                          ? AppColors.primary
                                          : Colors.grey,
                                    ),
                                    Text(
                                      'Biaya Konsultasi',
                                      style: AppStyle.body3
                                          .copyWith(color: Colors.black),
                                    ),
                                    Text(
                                      ''.toIDR(
                                        amount: data.price!.price!,
                                      ),
                                      style: AppStyle.body1
                                          .copyWith(color: AppColors.primary),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: AppColors.primary,
                                  size: 11,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  data.notarisDetails!.city!,
                                  style: AppStyle.body4.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    data.notarisDetails!.dateOfBirth!,
                    style: AppStyle.body2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Nomor SK Notaris',
                    style: AppStyle.body3.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.notarisDetails!.noSk!,
                    style: AppStyle.body2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Alumnus',
                    style: AppStyle.body3.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.notarisDetails!.alumnus!,
                    style: AppStyle.body2.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SkyButton(
                      text: 'Konsultasi',
                      textColor: Colors.white,
                      color: AppColors.primary,
                      onPressed: () {                        
                        Navigator.pop(context);
                        LocalStorage.to.saveDetailsNotaris(data.notarisDetails);
                        controller.createRoomChat();
                        Get.toNamed(
                          DetailTransactionPage.routeName,
                          arguments: data,
                          // ChatScreenPage.routeName
                        );
                        // debugPrint(data.toString());
                      },
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  // Widget tabItems({required String title}) {
  //   return Container(
  //     width: 30,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(5), border: Border.all()),
  //     child: Text(
  //       title,
  //       style: AppStyle.body1,
  //     ),
  //   );
  // }
}
