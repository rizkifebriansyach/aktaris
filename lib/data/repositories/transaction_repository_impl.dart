import 'package:aktaris_app/core/database/shared_prefs.dart';
import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/data/datasource/transaction/transaction_local_datasource.dart';
import 'package:aktaris_app/data/datasource/transaction/transaction_remote_datasource.dart';
import 'package:aktaris_app/domain/entities/transaction/transaction_history_entity.dart';
import 'package:aktaris_app/domain/repository/transaction_repository.dart';
import 'package:dartz/dartz.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDatasource transactionRemoteDatasource;
  final TransactionLocalDatasource? transactionLocalDatasource;
  TransactionRepositoryImpl({required this.transactionRemoteDatasource, this.transactionLocalDatasource});

  @override
  Future<Either<Failure, Map<String, dynamic>>> getPrice(
      {String? packageid, required String productName}) async {
    try {
      final result = await transactionRemoteDatasource.getPrice(
        productName: productName,
        packageid: packageid,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> createTransaction(
      {String? packageid, required String productName}) async {
    try {
      final result = await transactionRemoteDatasource.createTransaction(
        productName: productName,
        packageid: packageid,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> payment(
      {required String transactionId, required String paymentType}) async {
    try {
      final result = await transactionRemoteDatasource.payment(
        transactionId: transactionId,
        paymentType: paymentType,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> checkStatusPayment(
      {required String transactionId}) async {
    try {
      final result = await transactionRemoteDatasource.checkStatusPayment(
          transactionId: transactionId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> createTransactionRoomChat(
      {required int userId, required String transactionId}) async {
    try {
      final result =
          await transactionRemoteDatasource.createTransactionRoomChat(
        userId: userId,
        transactionId: transactionId,
      );
      prefs.setString(KeyPrefs.roomId, result["chat"]["room"]["rid"]);
      prefs.setString(KeyPrefs.xAuthToken, result["x-auth-token"]);
      prefs.setString(KeyPrefs.xUserId, result["x-user-id"]);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TransactionHistoryEntity>>>
      getListHistory() async {
    try {
      final result = await transactionLocalDatasource!.getListHistory();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
