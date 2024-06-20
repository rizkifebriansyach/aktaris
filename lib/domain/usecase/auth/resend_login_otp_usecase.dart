import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:aktaris_app/domain/entities/auth/login_entity.dart';
import 'package:aktaris_app/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ResendLoginOtpUsecase
    extends ParamUseCase<LoginEntity, ResendLoginOtpParams> {
  final AuthRepository repository;
  ResendLoginOtpUsecase({required this.repository});

  @override
  Future<Either<Failure, LoginEntity>> execute(
      ResendLoginOtpParams params) async {
    return await repository.resendLoginOtp(userId: params.userId);
  }
}

class ResendLoginOtpParams extends Equatable {
  final int userId;
  const ResendLoginOtpParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}
