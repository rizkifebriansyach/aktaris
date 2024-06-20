import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:aktaris_app/domain/entities/auth/login_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../repository/auth_repository.dart';

class LoginUsecase extends ParamUseCase<LoginEntity,LoginParams>{
  final AuthRepository repository;
  LoginUsecase({required this.repository});
  @override
  Future<Either<Failure, LoginEntity>> execute(LoginParams params) async{
    return await repository.login(email: params.email, password: params.password);
  }
  
}

class LoginParams extends Equatable{
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
  @override
  List<Object?> get props =>[email,password] ;
  
}