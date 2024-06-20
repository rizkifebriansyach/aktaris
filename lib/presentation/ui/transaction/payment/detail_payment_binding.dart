import 'package:aktaris_app/data/datasource/chat/chat_remote_datasource.dart';
import 'package:aktaris_app/data/datasource/transaction/transaction_remote_datasource.dart';
import 'package:aktaris_app/data/repositories/chat/chat_repository_impl.dart';
import 'package:aktaris_app/data/repositories/transaction_repository_impl.dart';
import 'package:aktaris_app/domain/usecase/chat/create_room_usecase.dart';
import 'package:aktaris_app/domain/usecase/transaction/check_status_payment_usecase.dart';
import 'package:aktaris_app/domain/usecase/transaction/create_room_chat_transaction_usecase.dart';
import 'package:aktaris_app/presentation/ui/transaction/payment/detail_payment_controller.dart';
import 'package:get/get.dart';

class DetailPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailPaymentController(
        Get.find<CheckStatusPaymentUsecase>(),
        Get.find<CreateRoomUsecase>(),
        Get.find<CreateRoomChatTransactionUsecase>()));
    Get.lazyPut(() => CreateRoomUsecase(
        chatRepository: ChatRepositoryImpl(
            chatRemoteDatasource: ChatRemoteDatasourceImpl())));
    Get.lazyPut(() => CreateRoomChatTransactionUsecase(
        repository: TransactionRepositoryImpl(
            transactionRemoteDatasource: TransactionRemoteDatasourceImpl())));
    Get.lazyPut(
      () => CheckStatusPaymentUsecase(
        repository: TransactionRepositoryImpl(
          transactionRemoteDatasource: TransactionRemoteDatasourceImpl(),
        ),
      ),
    );
  }
}
