import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/data/datasource/profile/profile_remote_datasource.dart';
import 'package:aktaris_app/domain/entities/auth/verify_login_entity.dart';
import 'package:aktaris_app/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/database/get_storage.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDatasource profileRemoteDatasource;

  ProfileRepositoryImpl({required this.profileRemoteDatasource});

  @override
  Future<Either<Failure, String>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final result = await profileRemoteDatasource.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyLoginEntity>> changeProfileData(
      {String? name,
      String? birthPlace,
      String? address,
      String? dateOfBirth,
      String? gender,
      String? marriageStatus,
      String? religion,
      String? nik,
      String? npwp,
      String? motherName}) async {
    try {
      final result = await profileRemoteDatasource.changeProfileData(
        address: address,
        birthPlace: birthPlace,
        dateOfBirth: dateOfBirth,
        gender: gender,
        marriageStatus: marriageStatus,
        motherName: motherName,
        name: name,
        nik: nik,
        npwp: npwp,
        religion: religion,
      );
      LocalStorage.to.saveUser(result);
      return Right(result);
    } catch (e) {
      debugPrint("error profile: $e");
      return Left(ServerFailure(e.toString()));
    }
  }
}
