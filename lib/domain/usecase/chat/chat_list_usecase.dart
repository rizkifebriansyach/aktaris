import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:aktaris_app/domain/entities/chat/list_message_entity.dart';
import 'package:aktaris_app/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/chat/chat_model.dart';

class ChatListUsecase
    extends ParamUseCase<MessageListEntity, ChatListParams> {
  final ChatRepository repository;
  ChatListUsecase({required this.repository});

  @override
  Future<Either<Failure, MessageListEntity>>  execute(
      ChatListParams params) async {
    return await repository.getMessageList(roomId: params.roomId);
  }
}

class ChatListParams extends Equatable {
  final String roomId;
  const ChatListParams({required this.roomId});

  @override
  List<Object?> get props => [roomId];
}
