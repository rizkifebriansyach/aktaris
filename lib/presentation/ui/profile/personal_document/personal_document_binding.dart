import 'package:aktaris_app/presentation/ui/profile/personal_document/personal_document_controller.dart';
import 'package:get/get.dart';

class PersonalDocBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalDocController());
  }

}