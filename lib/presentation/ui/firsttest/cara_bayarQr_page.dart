// ignore_for_file: file_names

import 'package:aktaris_app/presentation/widget/custom_appbar.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// Flutter code sample for [ListTile] selection in a [ListView] or [GridView].

void main() => runApp(const caraBayarQrPage());

// ignore: camel_case_types
class caraBayarQrPage extends StatelessWidget {
  static String routeName = '/cara-bayarqR';
  const caraBayarQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(
          title: 'Pembayaran',
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
        children: [
          Expanded(child: caraBayar()),
          bottomButton(),
        ],
      ),
    );
  }
}

Widget caraBayar(){
  return 
        SizedBox(
          child: ListView.builder(
            itemCount: 1,
            shrinkWrap: false,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                                'QR Code',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset('assets/images/transaksi1.png', height: 100,),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Scan/Capture QR Code diatas',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 5,
                        thickness: 0.7,
                      ),                      
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Batas Akhir Pembayaran',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rabu, 22 Jun 2022 23:57 WIB',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '3:33:30',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Cara Pembayaran',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Scan QR Code',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '1. Pada perangkat Anda yang lain, buka Aplikasi Pembayaran “Gojek”',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        '2. Pada Wallet Bar, klik tombol “Pay”',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        '3. Scan QR Code diatas',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        '4. Lakukan pembayaran sesuai dengan nominal yang ditentukan',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        '5. Masukkan PIN',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        '6. Selesai',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Capture QR Code',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '1. Simpan atau capture QR Code diatas',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        '2. Pada perangkat Anda yang lain, buka Aplikasi Pembayaran “Gojek”',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        '3. Pada Wallet Bar, klik tombol “Pay”',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        '4. Pilih tombol untuk Upload Gambar',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        '5. Pilih QR Code yang sudah disimpan',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        '6. Lakukan pembayaran sesuai dengan nominal yang ditentukan',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        '7. Masukkan PIN',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        '8. Selesai',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Lihat Transaksi Saya',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // onTap: () {
                //   controller.filteredNotaris[index]['status'] == "Online"
                //   ? bottomSheet(context, controller.filteredNotaris[index])
                //   : null;
                // },
              );
            },
          ),
        );
    // );
}
Widget bottomButton() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: SkyButton(
          text: 'Konfirmasi Pembayaran',
          textColor: Colors.white,
          fontSize: 12,
          onPressed: () {
            // controller.formKeyChangePassword.currentState?.validate();
          }
        ),
      )
    ],
  );
}
