import 'package:aktaris_app/data/datasource/transaction/transaction_remote_datasource.dart';
import 'package:aktaris_app/data/repositories/transaction_repository_impl.dart';
import 'package:aktaris_app/domain/usecase/transaction/create_transaction_usecase.dart';
import 'package:aktaris_app/domain/usecase/transaction/getprice_usecase.dart';
import 'package:aktaris_app/domain/usecase/transaction/payment_usecaase.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_transaction/detail_transaction_controller.dart';
import 'package:get/get.dart';

class DetailTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailTransactionController(Get.find<GetPriceUsecase>(), Get.find<CreateTransactionUsecase>(), Get.find<PaymentUsecase>()));
    Get.lazyPut(
      () => GetPriceUsecase(
        repository: TransactionRepositoryImpl(
          transactionRemoteDatasource: TransactionRemoteDatasourceImpl(),
        ),
      ),
    );
    Get.lazyPut(
      () => CreateTransactionUsecase(
        repository: TransactionRepositoryImpl(
          transactionRemoteDatasource: TransactionRemoteDatasourceImpl(),
        ),
      ),
    );
    Get.lazyPut(
      () => PaymentUsecase(
        repository: TransactionRepositoryImpl(
          transactionRemoteDatasource: TransactionRemoteDatasourceImpl(),
        ),
      ),
    );
  }
}
