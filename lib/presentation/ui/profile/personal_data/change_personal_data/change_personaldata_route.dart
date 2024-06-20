import 'package:aktaris_app/presentation/ui/profile/personal_data/change_personal_data/change_personaldata_binding.dart';
import 'package:aktaris_app/presentation/ui/profile/personal_data/change_personal_data/change_personaldata_page.dart';
import 'package:get/get.dart';

final changePersonalDataRoute = [
  GetPage(
    name: ChangePersonalDataPage.routeName,
    page: () => const ChangePersonalDataPage(),
    binding: ChangePersonalDataBinding(),
  )
];
