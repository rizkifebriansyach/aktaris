import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/core/extension/string_extension.dart';
import 'package:aktaris_app/presentation/widget/custom_appbar.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// Flutter code sample for [ListTile] selection in a [ListView] or [GridView].

void main() => runApp(const rincianBayarPage());

// ignore: camel_case_types
class rincianBayarPage extends StatelessWidget {
  static String routeName = '/rincian-bayar';
  const rincianBayarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(
          title: 'Rincian Pembayaran',
          centerTitle: true,
          titleStyle: const TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontSize: 18,
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))),
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Image.asset(
           'assets/images/Check.png',
            height: 50,
          ),
          // Image.asset(
          //  'assets/images/Cancel.png',
          //   height: 50,
          // ),
          const SizedBox(height: 10),
          const Text("Pembayaran Gagal",
            style: TextStyle(
            fontSize: 15,
            fontFamily: 'Poppin',
          )),
          const Text("35.000",
            style: TextStyle(
            fontSize: 15,
            fontFamily: 'Poppin',
          )),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  notarisDetail(),
                  // detailPrice(),
                  Expanded(child: detailPrice()),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      height: 25,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 157, 231, 204),
                          borderRadius: BorderRadius.circular(5)),
                      child:
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 7),
                            const Icon(
                              Icons.info,
                              size: 17,
                              color: Color.fromARGB(255, 21, 124, 86),
                              
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                'Struk ini dapat dijadikan sebagai bukti pembayaran yang sah',
                                style: AppStyle.body3.copyWith(
                                  fontSize: 10,
                                  color: Colors.black45,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SkyButton(
                        text: 'Lihat ke Halaman Transaksi',
                        textColor: Colors.white,
                        fontSize: 12,
                        onPressed: () {
                          // controller.formKeyChangePassword.currentState?.validate();
                        }),
                  )
                ],
              ),
            ),
          ),
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

  Widget detailPrice() {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      padding: const EdgeInsets.all(16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Status',
                style: TextStyle(color: Colors.black)
              ),
              SizedBox(height: 10),
              Text(
                'Metode Pembayaran',
                style: TextStyle(color: Colors.black)
              ),
              SizedBox(height: 10),
              Text(
                'ID Transaksi',
                style: TextStyle(color: Colors.black)
              ),
              SizedBox(height: 10),
              Text(
                'Rincian Pembayaran',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 10),
              Text(
                'Biaya Konsultasi 30 Menit',
                style: TextStyle(color: Colors.black)
              ),
              SizedBox(height: 10),
              Text(
                'Biaya Layanan',
                style: TextStyle(color: Colors.black)
              ),
              SizedBox(height: 10),
              Text(
                'Promo Pengguna Baru',
                style: TextStyle(color: Colors.black)
              ),
              SizedBox(height: 10),
              Text(
                'Total Pembayaran',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Gagal',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 10),
              Text(
                // ''.toIDR(amount: 35000),
                'Gopay',
                style: TextStyle(color: Colors.black)
              ),
              SizedBox(height: 10),
              Text(
                // ''.toIDR(amount: 35000),
                'ID-00000134',
                style: TextStyle(color: Colors.black)
              ),
              SizedBox(height: 10),
              Text(
                'Rincian',
                style: TextStyle(color: Colors.transparent)
              ),
              SizedBox(height: 10),
              Text(
                // ''.toIDR(amount: 35000),
                '50000',
                style: TextStyle(color: Colors.black)
              ),
              SizedBox(height: 10),
              Text(
                // ''.toIDR(amount: 35000),
                '5000',
                style: TextStyle(color: Colors.black)
              ),
              SizedBox(height: 10),
              Text(
                // ''.toIDR(amount: 35000),
                '-20000',
                style: TextStyle(color: Colors.red)
              ),
              SizedBox(height: 10),
              Text(
                // ''.toIDR(amount: 35000),
                '35000',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
              ),
            ],
          )
        ],
      ),
    );
  }
}
