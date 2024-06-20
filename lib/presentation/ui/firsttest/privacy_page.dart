import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/presentation/widget/custom_appbar.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const privacyPage());

// ignore: camel_case_types
class privacyPage extends StatelessWidget {
  static String routeName = '/privacy';
  const privacyPage({super.key});

  final String pdfText =
      """Selamat datang di Aktaris, aplikasi yang menghubungkan Anda dengan notaris untuk konsultasi masalah hukum dan pertanahan. Kebijakan Privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi pribadi Anda saat Anda menggunakan aplikasi Aktaris.

**Informasi yang Kami Kumpulkan**

1. **Informasi Pribadi:** Ketika Anda menggunakan Aktaris, kami dapat mengumpulkan informasi pribadi seperti nama, alamat email, nomor telepon, dan informasi identifikasi lainnya yang Anda berikan saat mendaftar atau menggunakan layanan kami.

2. **Informasi Transaksi:** Kami dapat mengumpulkan informasi tentang transaksi yang Anda lakukan melalui Aktaris, termasuk pembayaran, konsultasi yang Anda lakukan, dan detail transaksi lainnya.

3. **Informasi Penggunaan:** Kami dapat mengumpulkan informasi tentang cara Anda menggunakan aplikasi Aktaris, termasuk interaksi Anda dengan notaris, riwayat konsultasi, dan preferensi pengguna lainnya.

**Bagaimana Kami Menggunakan Informasi Anda**

1. **Pelayanan:** Kami menggunakan informasi yang kami kumpulkan untuk menyediakan layanan Aktaris kepada Anda, termasuk menyambungkan Anda dengan notaris yang sesuai dengan kebutuhan konsultasi Anda.

2. **Peningkatan Layanan:** Kami menggunakan informasi Anda untuk memahami bagaimana Anda menggunakan Aktaris dan untuk meningkatkan layanan kami, termasuk personalisasi pengalaman pengguna.

3. **Komunikasi:** Kami dapat menggunakan informasi Anda untuk mengirimkan komunikasi terkait layanan, pemberitahuan penting, pembaruan produk, dan promosi Aktaris.

**Bagaimana Kami Melindungi Informasi Anda**

Kami mengambil langkah-langkah keamanan fisik, elektronik, dan prosedural yang sesuai untuk melindungi informasi pribadi Anda dari akses yang tidak sah, penggunaan, atau pengungkapan yang tidak sah. Namun, tidak ada sistem atau transmisi data yang dapat dijamin 100% aman.

**Pengungkapan Informasi**

Kami tidak akan menjual, menyewakan, atau menukar informasi pribadi Anda kepada pihak ketiga tanpa persetujuan Anda, kecuali seperti yang dijelaskan dalam Kebijakan Privasi ini atau sebagaimana diizinkan atau diwajibkan oleh hukum.

**Perubahan Kebijakan Privasi**

Kami dapat memperbarui Kebijakan Privasi ini dari waktu ke waktu dengan memposting revisi yang direvisi di Aktaris. Kami akan memberi tahu Anda tentang perubahan yang signifikan dalam Kebijakan Privasi ini dengan mengirimkan pemberitahuan melalui Aktaris atau dengan cara lain sesuai dengan hukum.

**Hubungi Kami**

Jika Anda memiliki pertanyaan atau kekhawatiran tentang Kebijakan Privasi Aktaris, silakan hubungi kami di [email protected]

Dengan menggunakan Aktaris, Anda menyetujui pengumpulan dan penggunaan informasi Anda sesuai dengan Kebijakan Privasi ini. Jika Anda tidak menyetujui Kebijakan Privasi ini, harap tidak menggunakan Aktaris.

Terima kasih telah memilih Aktaris sebagai aplikasi pilihan Anda untuk konsultasi hukum.
""";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: SkyAppBar.primary(
          title: 'Kebijakan Privasi',
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
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Text(
            'Kebijakan Privasi "Aplikasi Aktaris"', 
            style: AppStyle.body1.copyWith(fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: 
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: SingleChildScrollView(
                child: Text(pdfText, textAlign: TextAlign.justify,),
              ),
            )
          ),
          bottomButton(),
        ],
      ),
    ));
  }
}

Widget bottomButton() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: SkyButton(
            text: 'Saya telah membaca dan menyetujui',
            textColor: Colors.white,
            fontSize: 12,
            onPressed: () {
              // controller.formKeyChangePassword.currentState?.validate();
            }),
      )
    ],
  );
}
