import 'package:aktaris_app/domain/entities/auth/verify_login_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/param_usecase.dart';
import '../../repository/auth_repository.dart';

class VerifyLoginUsecase extends ParamUseCase<VerifyLoginEntity, VerifyLoginParams> {
  final AuthRepository repository;
  VerifyLoginUsecase({required this.repository});

  @override
  Future<Either<Failure, VerifyLoginEntity>> execute(VerifyLoginParams params) async {
    return await repository.verifyLogin(
      userId: params.userId,
      otpCode: params.otpCode,
    );
  }
}

class VerifyLoginParams extends Equatable {
  final int userId;
  final String otpCode;

  const VerifyLoginParams({required this.userId, required this.otpCode});

  @override
  List<Object?> get props => [userId, otpCode];
}