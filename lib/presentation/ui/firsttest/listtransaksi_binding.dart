import 'package:aktaris_app/data/datasource/notaris/notaris_list%20local_datasource.dart';
import 'package:aktaris_app/data/datasource/notaris/notaris_list_remote_datasource.dart';
import 'package:aktaris_app/data/repositories/notaris_repository_impl.dart';
import 'package:aktaris_app/domain/usecase/notaris_list_usecase.dart';
import 'package:aktaris_app/presentation/ui/notaris/notaris_controller.dart';
import 'package:get/get.dart';

import '../../../data/datasource/transaction/transaction_remote_datasource.dart';
import '../../../data/repositories/transaction_repository_impl.dart';
import '../../../domain/usecase/chat/create_room_usecase.dart';
import '../../../domain/usecase/transaction/getprice_usecase.dart';

// ignore: camel_case_types
class listtransaksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotarisController(Get.find<NotarisListUsecase>(), Get.find<GetPriceUsecase>(), Get.find<CreateRoomUsecase>()));
    Get.lazyPut(
      () => GetPriceUsecase(
        repository: TransactionRepositoryImpl(
          transactionRemoteDatasource: TransactionRemoteDatasourceImpl(),
        ),
      ),
    );
    Get.lazyPut(
      () => NotarisListUsecase(
        repository: NotarisRepositoryImpl(
          notarisListRemoteDatasource: NotarisListRemoteDatasourceImpl(),
          notarisListLocalDatasource: NotarisListLocalDatasourceImpl(
            notarisListRemoteDatasourceImpl: NotarisListRemoteDatasourceImpl(),
          ),
        ),
      ),
    );
  }
}
