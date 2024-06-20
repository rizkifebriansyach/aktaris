import 'package:aktaris_app/presentation/ui/profile/setting/change_password/change_password_binding.dart';
import 'package:aktaris_app/presentation/ui/profile/setting/change_password/change_password_page.dart';
import 'package:get/get.dart';

final changePasswordRoute = [
  GetPage(
    name: ChangePasswordPage.routeName,
    page: () => const ChangePasswordPage(),
    binding: ChangePasswordBinding(),
  )
];
