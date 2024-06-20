import 'package:aktaris_app/presentation/ui/transaction/detail_history/detail_history_controller.dart';
import 'package:get/get.dart';

class DetailHistoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailHistoryController());
  }
}