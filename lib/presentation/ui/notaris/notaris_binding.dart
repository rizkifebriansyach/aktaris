import 'package:aktaris_app/data/datasource/notaris/notaris_list%20local_datasource.dart';
import 'package:aktaris_app/data/datasource/notaris/notaris_list_remote_datasource.dart';
import 'package:aktaris_app/data/repositories/notaris_repository_impl.dart';
import 'package:aktaris_app/domain/usecase/chat/create_room_usecase.dart';
import 'package:aktaris_app/domain/usecase/transaction/getprice_usecase.dart';
import 'package:aktaris_app/domain/usecase/notaris_list_usecase.dart';
import 'package:aktaris_app/presentation/ui/notaris/notaris_controller.dart';
import 'package:get/get.dart';

import '../../../data/datasource/chat/chat_remote_datasource.dart';
import '../../../data/datasource/transaction/transaction_remote_datasource.dart';
import '../../../data/repositories/chat/chat_repository_impl.dart';
import '../../../data/repositories/transaction_repository_impl.dart';

class NotarisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotarisController(Get.find<NotarisListUsecase>(),
        Get.find<GetPriceUsecase>(), Get.find<CreateRoomUsecase>()));
    Get.lazyPut(() => CreateRoomUsecase(
        chatRepository: ChatRepositoryImpl(
            chatRemoteDatasource: ChatRemoteDatasourceImpl())));
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
