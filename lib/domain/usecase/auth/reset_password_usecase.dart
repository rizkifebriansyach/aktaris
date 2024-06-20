import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:aktaris_app/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ResetPasswordUsecase extends ParamUseCase<String, ResetPasswordParams> {
  final AuthRepository repository;
  ResetPasswordUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> execute(ResetPasswordParams params) async {
    return repository.resetPassword(email: params.email);
  }
}

class ResetPasswordParams extends Equatable {
  final String email;
  const ResetPasswordParams({required this.email});

  @override
  List<Object?> get props => [email];
}
