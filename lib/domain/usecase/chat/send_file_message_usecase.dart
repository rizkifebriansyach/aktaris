import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../repository/chat_repository.dart';

class SendFileMessageUsecase
    extends ParamUseCase<Map<String, dynamic>, SendFileMessageParams> {
  final ChatRepository chatRepository;
  SendFileMessageUsecase({required this.chatRepository});
  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      SendFileMessageParams params) async {
    return await chatRepository.sendFile(
        docFile: params.docFile, message: params.message);
  }
}

class SendFileMessageParams extends Equatable {
  final String docFile;
  final String? message;

  const SendFileMessageParams({required this.docFile, this.message});

  @override
  List<Object?> get props => [docFile, message];
}
