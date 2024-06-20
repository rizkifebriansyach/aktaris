import 'package:aktaris_app/presentation/ui/profile/profile_binding.dart';
import 'package:aktaris_app/presentation/ui/profile/profile_page.dart';
import 'package:get/get.dart';

final profileRoute = [
  GetPage(
    name: ProfilePage.routeName, 
    page: ()=> const ProfilePage(),
    binding: ProfileBinding())
];