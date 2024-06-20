import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/no_param_usecase.dart';
import 'package:aktaris_app/domain/entities/transaction/transaction_history_entity.dart';
import 'package:aktaris_app/domain/repository/transaction_repository.dart';
import 'package:dartz/dartz.dart';

class GetListHistoryOrderUsecase
    extends NoParamUseCase<List<TransactionHistoryEntity>> {
  final TransactionRepository repository;
  GetListHistoryOrderUsecase({required this.repository});

  @override
  Future<Either<Failure, List<TransactionHistoryEntity>>> execute() async {
    return await repository.getListHistory();
  }
}
