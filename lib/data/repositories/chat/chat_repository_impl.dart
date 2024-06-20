import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/data/datasource/chat/chat_remote_datasource.dart';
import 'package:aktaris_app/data/model/chat/chat_model.dart';
import 'package:aktaris_app/domain/entities/chat/list_message_entity.dart';
import 'package:aktaris_app/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDatasource chatRemoteDatasource;
  ChatRepositoryImpl({required this.chatRemoteDatasource});

  @override
  Future<Either<Failure, Map<String, dynamic>>> createRoomChat(
      {required int userId}) async {
    try {
      final result = await chatRemoteDatasource.createRoomChat(userId: userId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> sendMessage(
      {required String roomId, required String message}) async {
    try {
      final result = await chatRemoteDatasource.sendMessage(
        roomId: roomId,
        message: message,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageListEntity>> getMessageList(
      {required String roomId}) async {
    try {
      final result = await chatRemoteDatasource.getMessageList(roomId: roomId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> sendFile({
    required String docFile,
    String? message,
  }) async {
    try {
      final result = await chatRemoteDatasource.sendFile(
          docFile: docFile, message: message);
      return right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
