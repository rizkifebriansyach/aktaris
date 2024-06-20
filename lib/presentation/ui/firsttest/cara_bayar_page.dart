import 'package:aktaris_app/presentation/widget/custom_appbar.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// Flutter code sample for [ListTile] selection in a [ListView] or [GridView].

void main() => runApp(const caraBayarPage());

// ignore: camel_case_types
class caraBayarPage extends StatelessWidget {
  static String routeName = '/cara-bayar';
  const caraBayarPage({super.key});

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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Batas Akhir Pembayaran',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mandiri VA',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          ImageIcon(
                            AssetImage('assets/images/Mandiris.png'),
                            // color: Colors.amber,
                            size: 50,
                          ),
                        ],
                      ),
                      Divider(
                        height: 5,
                        thickness: 0.7,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Virtual Account',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'AZ089665636946',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Total Pembayaran',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rp 35.000',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 5,
                        thickness: 0.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
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
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Cara Pembayaran',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mandiri VA',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          // Image.asset(
                          // 'assets/images/Check.png',
                          //   height: 50,
                          // ),
                          ImageIcon(
                            AssetImage('assets/images/Mandiris.png'),
                            // color: Colors.amber,
                            size: 50,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Internet Banking & Mandiri Online',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1. Login Mandiri Online dengan memasukkan username dan password',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '2. Pilih menu “Pembayaran”',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '3. Pilih menu “Multipayment”',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '4. Pilih nama penyedia jasa',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '5. Masukkan “No. Virtual Account”',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '6. Setelah muncul tagihan, pilih konfirmasi',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '7. Masukkan PIN',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '8. Transaksi selesai dengan menampilkan bukti pembayaran',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '9. Kembali ke Aplikasi Listrindo Mobile untuk melihat rincian transaksi Anda.',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'ATM Mandiri (Prabayar & Pascabayar)',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1. Pilih Bahasa',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '2. Input PIN',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '3. Pilih Bayar/Beli',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '4. Pilih lainnya',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '5. Pilih menu Lainnya',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '6. Pilih MultiPayment',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '7. Masukkan kode perusahaan atau nama provider',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '8. Masukkan “No. Virtual Account”',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '9. Muncul konfirmasi data pembayaran, ketikkan angka 1 bila sesuai',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '10. Muncul konfirmasi data pembayaran, pilih benar',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '11. Transaksi berhasil dan menerima struk pembayaran',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '12. Kembali ke Aplikasi Aktaris Mobile untuk melihat rincian transaksi Anda',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
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
