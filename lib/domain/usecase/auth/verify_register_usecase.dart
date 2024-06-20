import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:aktaris_app/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class VerifyRegisterUsecase extends ParamUseCase<String, VerifyRegisterParams> {
  final AuthRepository repository;
  VerifyRegisterUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> execute(params) async {
    return await repository.verifyRegister(
      userId: params.userId,
      otpCode: params.otpCode,
    );
  }
}

class VerifyRegisterParams extends Equatable {
  final int userId;
  final String otpCode;

  const VerifyRegisterParams({required this.userId, required this.otpCode});

  @override
  List<Object?> get props => [userId, otpCode];
}
