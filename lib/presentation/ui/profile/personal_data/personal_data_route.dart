import 'package:aktaris_app/presentation/ui/profile/personal_data/personal_data_binding.dart';
import 'package:aktaris_app/presentation/ui/profile/personal_data/personal_data_page.dart';
import 'package:get/get.dart';

final personalDataRoute = [
  GetPage(
    name: PersonalDataPage.routeName,
    page: () => const PersonalDataPage(),
    binding: PersonalDataBinding(),
  )
];
