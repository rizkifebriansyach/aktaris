import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/param_usecase.dart';
import '../../repository/transaction_repository.dart';

class CheckStatusPaymentUsecase
    extends ParamUseCase<Map<String, dynamic>, CheckStatusPaymentParams> {
  final TransactionRepository repository;
  CheckStatusPaymentUsecase({required this.repository});

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      CheckStatusPaymentParams params) async {
    return await repository.checkStatusPayment(
        transactionId: params.transactionId);
  }
}

class CheckStatusPaymentParams extends Equatable {
  final String transactionId;

  const CheckStatusPaymentParams({required this.transactionId});

  @override
  List<Object?> get props => [transactionId];
}
