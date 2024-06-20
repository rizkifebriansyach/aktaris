import 'package:aktaris_app/presentation/ui/notaris/notaris_binding.dart';
import 'package:aktaris_app/presentation/ui/notaris/notaris_page.dart';
import 'package:get/get.dart';

final notarisListRoute = [
  GetPage(
    name: NotarisPage.routeName,
    page: () => const NotarisPage(),
    binding: NotarisBinding(),
  )
];
