import 'package:aktaris_app/presentation/ui/auth/login/login_binding.dart';
import 'package:aktaris_app/presentation/ui/auth/login/login_page.dart';
import 'package:get/get.dart';

final loginRoute = [
  GetPage(
    name: LoginPage.routeName,
    page: () => const LoginPage(),
    binding: LoginBinding(),
  )
];
