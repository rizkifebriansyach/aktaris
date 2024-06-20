import 'package:aktaris_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/chat/chat_model.dart';
import '../entities/chat/list_message_entity.dart';

abstract class ChatRepository{
  Future<Either<Failure, Map<String, dynamic>>> createRoomChat({
    required int userId,
  });

  Future<Either<Failure, Map<String, dynamic>>> sendMessage({
    required String roomId,
    required String message,
  });

  Future<Either<Failure, MessageListEntity>>  getMessageList({
    required String roomId,
  });

  Future<Either<Failure, Map<String, dynamic>>> sendFile({
    required String docFile,
    String? message,
  });
}
