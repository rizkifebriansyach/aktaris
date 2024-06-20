import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/domain/entities/auth/verify_login_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, String>> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  Future<Either<Failure, VerifyLoginEntity>> changeProfileData({
    String? name,
    String? birthPlace,
    String? address,
    String? dateOfBirth,
    String? gender,
    String? marriageStatus,
    String? religion,
    String? nik,
    String? npwp,
    String? motherName,
  });
}
