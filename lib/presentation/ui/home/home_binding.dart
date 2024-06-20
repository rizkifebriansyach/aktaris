import 'package:aktaris_app/presentation/ui/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(() => HomeController());
  }

}