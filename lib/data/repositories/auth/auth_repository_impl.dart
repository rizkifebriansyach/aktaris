import 'package:aktaris_app/config/auth/auth_manager.dart';
import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/data/datasource/auth_remote_datasource.dart';
import 'package:aktaris_app/domain/entities/auth/login_entity.dart';
import 'package:aktaris_app/domain/entities/auth/register_entity.dart';
import 'package:aktaris_app/domain/entities/auth/verify_login_entity.dart';
import 'package:aktaris_app/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/failure.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl({required this.authRemoteDatasource});
  @override
  Future<Either<Failure, RegisterEntity>> register(
      {required String phoneNumber,
      required String email,
      required String password}) async {
    try {
      final result = await authRemoteDatasource.register(
        phoneNumber: phoneNumber,
        email: email,
        password: password,
      );
      LocalStorage.to.saveRegisterData(result);
      return Right(result);
    } catch (e) {
      debugPrint("Error AuthRepositoryImpl catch : $e");
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> verifyRegister({
    required int userId,
    required String otpCode,
  }) async {
    try {
      final result = await authRemoteDatasource.verifyRegister(
          userId: userId, otpCode: otpCode);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result =
          await authRemoteDatasource.login(email: email, password: password);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyLoginEntity>> verifyLogin({
    required int userId,
    required String otpCode,
  }) async {
    try {
      final result = await authRemoteDatasource.verifyLogin(
          userId: userId, otpCode: otpCode);
          LocalStorage.to.saveUser(result);
          LocalStorage.to.saveToken(result.token!.accessToken!);
          LocalStorage.to.saveRefreshToken(result.token!.refreshToken!);
      // AuthManager.find.login(
      //     user: result.user,
      //     token: result.token?.accessToken,
      //     refreshToken: result.token?.refreshToken);
          debugPrint("TOKEN REPOSITORY : ${LocalStorage.to.getToken()}");
          debugPrint("REFRESH TOKEN REPOSITORY : ${LocalStorage.to.getRefreshToken()}");
      return Right(result);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> resendLoginOtp(
      {required int userId}) async {
    try {
      final result = await authRemoteDatasource.resendLoginOtp(userId: userId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> resendRegisterOtp(
      {required int userId}) async {
    try {
      final result =
          await authRemoteDatasource.resendRegisterOtp(userId: userId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword({required String email}) async {
    try {
      final result = await authRemoteDatasource.resetPassword(email: email);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
