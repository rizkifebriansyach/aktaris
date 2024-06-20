import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:aktaris_app/domain/entities/auth/register_entity.dart';
import 'package:aktaris_app/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RegisterUsecase
    extends ParamUseCase<RegisterEntity, ReqisterParams> {
  final AuthRepository repository;
  RegisterUsecase({required this.repository});

  @override
  Future<Either<Failure, RegisterEntity>> execute(
     ReqisterParams params) async {
    return await repository.register(
     phoneNumber: params.phoneNumber,
     email: params.email,
     password: params.password,
    );
  }

 
}

 class ReqisterParams extends Equatable{
  final String phoneNumber;
  final String email;
  final String password;

  const ReqisterParams({required this.phoneNumber, required this.email, required this.password});
  @override
  List<Object?> get props => [phoneNumber,email,password];
  
 }
