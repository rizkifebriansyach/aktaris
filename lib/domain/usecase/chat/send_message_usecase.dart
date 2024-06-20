import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:aktaris_app/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SendMessageUsecase
    extends ParamUseCase<Map<String, dynamic>, SendMessageParams> {
  final ChatRepository chatRepository;
  SendMessageUsecase({required this.chatRepository});

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      SendMessageParams params) async {
    return await chatRepository.sendMessage(
        roomId: params.roomId, message: params.message);
  }
}

class SendMessageParams extends Equatable {
  final String roomId;
  final String message;

  const SendMessageParams({required this.roomId, required this.message});

  @override
  List<Object?> get props => [roomId, message];
}
