
import 'package:aktaris_app/domain/entities/auth/login_entity.dart';
import 'package:aktaris_app/domain/entities/auth/register_entity.dart';
import 'package:aktaris_app/domain/entities/auth/verify_login_entity.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterEntity>> register({
    required String phoneNumber,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> verifyRegister({
    required int userId,
    required String otpCode,
  });

  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, VerifyLoginEntity>> verifyLogin({
    required int userId,
    required String otpCode,
  });

  Future<Either<Failure,LoginEntity>> resendRegisterOtp({
    required int userId,
  });

  Future<Either<Failure,LoginEntity>> resendLoginOtp({
    required int userId,
  });

  Future<Either<Failure,String>>resetPassword({
    required String email,
  });
}
