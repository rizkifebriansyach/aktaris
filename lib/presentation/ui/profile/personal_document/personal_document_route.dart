import 'package:aktaris_app/presentation/ui/profile/personal_document/personal_document_binding.dart';
import 'package:aktaris_app/presentation/ui/profile/personal_document/personal_document_page.dart';
import 'package:get/get.dart';

final personalDocRoute = [
  GetPage(
    name: PersonalDocPage.routeName,
    page: () => const PersonalDocPage(),
    binding: PersonalDocBinding(),
  )
];
