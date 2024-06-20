import 'package:aktaris_app/presentation/ui/firsttest/listtransaksi_binding.dart';
import 'package:aktaris_app/presentation/ui/firsttest/listtransaksi_page.dart';
import 'package:get/get.dart';

final listtransaksiRoute = [
  GetPage(
    name: listtransaksiPage.routeName,
    page: () => const listtransaksiPage(),
    binding: listtransaksiBinding(),
  )
];
