import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:aktaris_app/domain/entities/auth/login_entity.dart';
import 'package:aktaris_app/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ResendRegisterOtpUsecase
    extends ParamUseCase<LoginEntity, ResendRegisterOtpParams> {
  final AuthRepository repository;
  ResendRegisterOtpUsecase({required this.repository});

  @override
  Future<Either<Failure, LoginEntity>> execute(
      ResendRegisterOtpParams params) async {
    return await repository.resendRegisterOtp(userId: params.userId);
  }
}

class ResendRegisterOtpParams extends Equatable {
  final int userId;
  const ResendRegisterOtpParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
