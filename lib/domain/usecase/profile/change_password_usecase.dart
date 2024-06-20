import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:aktaris_app/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ChangePasswordUsecase extends ParamUseCase<String, ChangePasswordParams>{
  final ProfileRepository repository;
  ChangePasswordUsecase({required this.repository});
  @override
  Future<Either<Failure, String>> execute(ChangePasswordParams params) async{
    return await repository.changePassword(oldPassword: params.oldPassword, newPassword: params.newPassword);
  }
}

class ChangePasswordParams extends Equatable{
  final String oldPassword;
  final String newPassword;

  const ChangePasswordParams({required this.oldPassword, required this.newPassword});

  @override
  List<Object?> get props => [oldPassword,newPassword];
}