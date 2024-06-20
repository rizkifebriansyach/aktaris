import 'package:aktaris_app/presentation/ui/profile/setting/setting_binding.dart';
import 'package:aktaris_app/presentation/ui/profile/setting/setting_page.dart';
import 'package:get/get.dart';

final settingRoute = [
  GetPage(
    name: SettingPage.routeName,
    page: () => const SettingPage(),
    binding: SettingBinding(),
  )
];
