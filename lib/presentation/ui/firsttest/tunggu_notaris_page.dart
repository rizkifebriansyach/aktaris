import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:get/get.dart';

/// Flutter code sample for [ListTile] selection in a [ListView] or [GridView].

void main() => runApp(const TungguNotarisPage());

// ignore: camel_case_types
class TungguNotarisPage extends StatelessWidget {
  static String routeName = '/cara-bayar';
  const TungguNotarisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: SkyAppBar.primary(
      //     title: 'Pembayaran',
      //     centerTitle: true,
      //     titleStyle: const TextStyle(
      //       color: Colors.black,
      //       fontFamily: "Poppins",
      //       fontSize: 18,
      //     ),
      //     leading: IconButton(
      //         onPressed: () => Get.back(),
      //         icon: const Icon(
      //           Icons.arrow_back,
      //           color: Colors.black,
      //         ))),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // notarisDetail(),
            const Text("Mohon Menunggu, ya..",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppin',
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: 50),
            // Image.asset('assets/images/transaksi1.png', height: 100,),
            LoadingAnimationWidget.fourRotatingDots(
              color: AppColors.primary,
              size: 100,
            ),
            const SizedBox(height: 50),
            const Text("Kami sedang menghubungkan Anda",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppin')),
            const SizedBox(height: 7),
            const Text("dengan Notaris",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppin',
                )),
          ],
        ),
      ),
    );
  }

  Widget notarisDetail() {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/user1_image.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Joko',
                            style: AppStyle.body1.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 25,
                            width: 80,
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.primary.withOpacity(0.4),
                                    width: 1.2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.work_outline,
                                  size: 13,
                                ),
                                const SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  '1 Tahun',
                                  style: AppStyle.body4
                                      .copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
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
                          style: AppStyle.body3.copyWith(
                            fontSize: 8,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
}
