import 'package:aktaris_app/presentation/ui/profile/mitra_notaris/mitra_notaris_controller.dart';
import 'package:get/get.dart';

class MitraNotarisBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MitraNotarisController());
  }

}