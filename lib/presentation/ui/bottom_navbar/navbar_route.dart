import 'package:aktaris_app/presentation/ui/bottom_navbar/navbar_binding.dart';
import 'package:aktaris_app/presentation/ui/bottom_navbar/navbar_component.dart';
import 'package:get/get.dart';

final navbarRoute = [
  GetPage(
    name: BottomNavBarComponent.routeName,
    page: () => const BottomNavBarComponent(),
    binding: NavbarBinding(),
  ),
];
