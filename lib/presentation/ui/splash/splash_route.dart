import 'package:aktaris_app/presentation/ui/splash/splash_binding.dart';
import 'package:aktaris_app/presentation/ui/splash/splash_page.dart';
import 'package:get/get.dart';

final splashRoute = [
  GetPage(
    name: SplashPage.routeName, 
    page: ()=> const SplashPage(),
    binding: SplashBinding())
];