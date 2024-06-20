import 'package:aktaris_app/presentation/ui/auth/register/register_binding.dart';
import 'package:aktaris_app/presentation/ui/auth/register/register_page.dart';
import 'package:get/get.dart';

final registerRoute = [
  GetPage(
    name: RegisterPage.routeName,
    page: () =>  RegisterPage(),
    binding: RegisterBinding(),
  )
];
