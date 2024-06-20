import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/domain/entities/transaction/transaction_history_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TransactionRepository {
  Future<Either<Failure, Map<String, dynamic>>> getPrice({
    String? packageid,
    required String productName,
  });

  Future<Either<Failure, Map<String, dynamic>>> createTransaction({
    String? packageid,
    required String productName,
  });

  Future<Either<Failure, Map<String, dynamic>>> payment({
    required String transactionId,
    required String paymentType,
  });

  Future<Either<Failure, Map<String, dynamic>>> checkStatusPayment({
    required String transactionId,
  });

  Future<Either<Failure, Map<String, dynamic>>> createTransactionRoomChat({
    required int userId,
    required String transactionId,
  });

  Future<Either<Failure, List<TransactionHistoryEntity>>> getListHistory();
}
