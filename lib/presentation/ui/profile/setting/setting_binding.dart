import 'package:aktaris_app/presentation/ui/profile/setting/setting_controller.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }

}