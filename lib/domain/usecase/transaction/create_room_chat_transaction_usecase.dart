import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../repository/transaction_repository.dart';

class CreateRoomChatTransactionUsecase extends ParamUseCase<
    Map<String, dynamic>, CreateRoomChatTransactionParams> {
  final TransactionRepository repository;
  CreateRoomChatTransactionUsecase({required this.repository});

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      CreateRoomChatTransactionParams params) async {
    return await repository.createTransactionRoomChat(
        userId: params.userId, transactionId: params.transactionId);
  }
}

class CreateRoomChatTransactionParams extends Equatable {
  final int userId;
  final String transactionId;

 const CreateRoomChatTransactionParams(
      {required this.userId, required this.transactionId});

  @override
  List<Object?> get props => [userId, transactionId];
}
