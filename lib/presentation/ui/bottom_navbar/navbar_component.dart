import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:aktaris_app/presentation/ui/bottom_navbar/navbar_controller.dart';
import 'package:aktaris_app/presentation/ui/home/home_page.dart';
import 'package:aktaris_app/presentation/ui/message/message_page.dart';
import 'package:aktaris_app/presentation/ui/profile/profile_page.dart';
import 'package:aktaris_app/presentation/ui/transaction/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BottomNavBarComponent extends GetView<NavbarController> {
  static String routeName = '/navbar';
  const BottomNavBarComponent({super.key});

  List<Widget> _buildScreens() {
    return [const HomePage(), const MessagePage(),const TransactionPage(),const ProfilePage()];
  }

  List<PersistentBottomNavBarItem> navbarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage("assets/icons/home_icon.png"),size: 25),
        title: 'Beranda',
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage("assets/icons/chat_icon.png"),size: 25),
        title: 'Pesan',
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage("assets/icons/paper_icon.png"),size: 25),
        title: 'Transaksi',
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage("assets/icons/profile_icon.png"),size: 25),
        title: 'Profil',
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller.navbarController,
      navBarHeight: kBottomNavigationBarHeight + 10,
      items: navbarItems(),
      screens: _buildScreens(),
    );
  }
}
