
import 'package:aktaris_app/config/theme/app_style.dart';
import 'package:aktaris_app/presentation/widget/custom_appbar.dart';
import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const syaratKetentuanPage());

// ignore: camel_case_types
class syaratKetentuanPage extends StatelessWidget {
  static String routeName = '/syarat-ketentuan';
  const syaratKetentuanPage({super.key});

  final String pdfText =
      """Selamat datang di Aktaris, aplikasi yang menghubungkan Anda dengan notaris untuk konsultasi masalah hukum dan pertanahan. Sebelum menggunakan layanan kami, harap membaca syarat dan ketentuan berikut dengan seksama:

1. **Penerimaan Syarat dan Ketentuan:** Dengan mengakses atau menggunakan aplikasi Aktaris, Anda secara otomatis menyetujui semua syarat dan ketentuan yang tercantum di sini. Jika Anda tidak menyetujui syarat dan ketentuan ini, Anda tidak diperkenankan untuk menggunakan aplikasi Aktaris.

2. **Tujuan Penggunaan:** Aktaris merupakan platform yang menyediakan layanan konsultasi hukum dan pertanahan melalui notaris terpercaya. Penggunaan layanan ini ditujukan untuk tujuan konsultasi dan informasi hukum saja. Aktaris tidak bertanggung jawab atas keputusan atau tindakan yang diambil berdasarkan informasi yang diberikan oleh notaris melalui aplikasi.

3. **Ketersediaan Layanan:** Layanan Aktaris tersedia untuk pengguna yang berusia 18 tahun ke atas. Kami berusaha untuk menyediakan layanan yang andal dan berkualitas, namun tidak menjamin ketersediaan atau kelengkapan informasi yang disediakan oleh notaris.

4. **Privasi Pengguna:** Aktaris menghormati privasi pengguna. Informasi pribadi yang diberikan oleh pengguna akan dijaga kerahasiaannya sesuai dengan Kebijakan Privasi yang berlaku.

5. **Kewajiban Pengguna:** Pengguna bertanggung jawab atas keamanan dan kerahasiaan akun mereka. Setiap aktivitas yang terjadi di bawah akun pengguna menjadi tanggung jawab pengguna tersebut.

6. **Pembayaran:** Layanan konsultasi di Aktaris dapat dikenakan biaya sesuai dengan tarif yang ditetapkan oleh masing-masing notaris. Pengguna akan diberitahu tentang biaya yang diperlukan sebelum melakukan konsultasi.

7. **Perubahan Syarat dan Ketentuan:** Aktaris berhak untuk mengubah syarat dan ketentuan ini tanpa pemberitahuan sebelumnya. Perubahan tersebut akan mulai berlaku segera setelah dipublikasikan di aplikasi.

Dengan menggunakan aplikasi Aktaris, Anda menyatakan bahwa Anda telah membaca, memahami, dan menyetujui syarat dan ketentuan yang tercantum di atas. Jika Anda memiliki pertanyaan atau kekhawatiran, jangan ragu untuk menghubungi tim dukungan kami.

Terima kasih telah menggunakan Aktaris sebagai sarana konsultasi hukum Anda..
""";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: SkyAppBar.primary(
          title: 'Syarat Ketentuan',
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
            'Syarat dan Ketentuan "Aplikasi Aktaris"', 
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
