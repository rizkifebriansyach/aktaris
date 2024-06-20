import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class NavbarController extends GetxController{
  late PersistentTabController navbarController;


  @override
  void onInit() {
    navbarController = PersistentTabController(initialIndex: 0);
    super.onInit();
  }
  
}