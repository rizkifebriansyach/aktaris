import 'package:aktaris_app/presentation/ui/bottom_navbar/navbar_controller.dart';
import 'package:aktaris_app/presentation/ui/home/home_controller.dart';
import 'package:aktaris_app/presentation/ui/profile/profile_controller.dart';
import 'package:aktaris_app/presentation/ui/transaction/transaction_controller.dart';
import 'package:get/get.dart';

import '../../../data/datasource/transaction/transaction_local_datasource.dart';
import '../../../data/datasource/transaction/transaction_remote_datasource.dart';
import '../../../data/repositories/transaction_repository_impl.dart';
import '../../../domain/usecase/transaction/get_list_history_order_usecase.dart';

class NavbarBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => NavbarController());
   Get.lazyPut(() => HomeController());
   Get.lazyPut(() => ProfileController());
   Get.lazyPut(
        () => TransactionController(Get.find<GetListHistoryOrderUsecase>()));
    Get.lazyPut(
      () => GetListHistoryOrderUsecase(
        repository: TransactionRepositoryImpl(
          transactionRemoteDatasource: TransactionRemoteDatasourceImpl(),
          transactionLocalDatasource: TransactionLocalDatasourceImpl(
            transactionRemoteDatasourceImpl: TransactionRemoteDatasourceImpl(),
          ),
        ),
      ),
    );
  }

}