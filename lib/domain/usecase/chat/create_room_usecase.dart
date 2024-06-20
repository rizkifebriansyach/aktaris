import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:aktaris_app/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CreateRoomUsecase
    extends ParamUseCase<Map<String, dynamic>, CreateRoomParamUsecase> {
  final ChatRepository chatRepository;
  CreateRoomUsecase({required this.chatRepository});

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      CreateRoomParamUsecase params) async {
    return await chatRepository.createRoomChat(userId: params.userId);
  }
}

class CreateRoomParamUsecase extends Equatable {
  final int userId;

  const CreateRoomParamUsecase({required this.userId});

  @override
  List<Object?> get props => [userId];
}
