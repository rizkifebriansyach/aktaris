import 'package:aktaris_app/presentation/ui/home/home_binding.dart';
import 'package:aktaris_app/presentation/ui/home/home_page.dart';
import 'package:get/get.dart';

final homeRoute = [
  GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      binding: HomeBinding())
];
