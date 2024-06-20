import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/core/extension/string_extension.dart';
import 'package:aktaris_app/data.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_transaction/detail_transaction_controller.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_transaction/detail_transaction_page.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widget/custom_appbar.dart';

class ChooseSessionPage extends GetView<DetailTransactionController> {
  static String routeName = "/choose-session";
  const ChooseSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(
        title: 'Ubah Sesi Konsultasi',
        centerTitle: true,
        titleStyle: const TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
          fontSize: 18,
        ),
      ),
      body: Column(
        children: [
          Divider(
            thickness: 5,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                separatorBuilder: (context, length) => const Divider(),
                itemCount: dataSession.length,
                itemBuilder: (context, index) {
                  debugPrint(dataSession[index]["title"].toString());
                  return SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataSession[index]["title"],
                              style:
                                  AppStyle.body1.copyWith(color: Colors.black),
                            ),
                            Text(
                              ''.toIDR(amount: dataSession[index]["price"]),
                              style: AppStyle.body1
                                  .copyWith(color: AppColors.primary),
                            ),
                          ],
                        ),
                        SkyButton(
                          width: 100,
                          height: 25,
                          text: "Pilih",
                          textColor: Colors.white,
                          fontSize: 12,
                          onPressed: () {
                            controller.titleKonsultasi.value =
                                dataSession[index]["title"];
                            controller.priceKonsultasi.value =
                                dataSession[index]["price"];
                            Get.offNamed(DetailTransactionPage.routeName,);
                            debugPrint(
                                "price1 : ${dataSession[index]["price"]}");
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
