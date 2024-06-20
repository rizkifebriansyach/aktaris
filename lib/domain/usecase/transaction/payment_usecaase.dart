import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../repository/transaction_repository.dart';

class PaymentUsecase extends ParamUseCase<Map<String, dynamic>, PaymentParams> {
  final TransactionRepository repository;
  PaymentUsecase({required this.repository});

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      PaymentParams params) async {
    return await repository.payment(
        transactionId: params.transactionId, paymentType: params.paymentType);
  }
}

class PaymentParams extends Equatable {
  final String transactionId;
  final String paymentType;

  const PaymentParams({required this.transactionId, required this.paymentType});

  @override
  List<Object?> get props => [transactionId, paymentType];
}
