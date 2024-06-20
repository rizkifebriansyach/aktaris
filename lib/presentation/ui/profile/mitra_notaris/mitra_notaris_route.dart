import 'package:aktaris_app/presentation/ui/profile/mitra_notaris/mitra_notaris_binding.dart';
import 'package:aktaris_app/presentation/ui/profile/mitra_notaris/mitra_notaris_page.dart';
import 'package:get/get.dart';

final mitraNotarisRoute = [
  GetPage(
    name: MitraNotarisPage.routeName,
    page: () => const MitraNotarisPage(),
    binding: MitraNotarisBinding(),
  )
];
