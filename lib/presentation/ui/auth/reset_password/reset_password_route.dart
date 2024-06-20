import 'package:aktaris_app/presentation/ui/auth/reset_password/reset_password_binding.dart';
import 'package:aktaris_app/presentation/ui/auth/reset_password/reset_password_page.dart';
import 'package:get/get.dart';

final resetPasswordRoute = [
  GetPage(
    name: ResetPasswordPage.routeName,
    page: () => const ResetPasswordPage(),
    binding: ResetPasswordBinding(),
  )
];
