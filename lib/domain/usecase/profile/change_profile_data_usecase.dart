import 'package:aktaris_app/domain/entities/auth/verify_login_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/param_usecase.dart';
import '../../repository/profile_repository.dart';

class ChangeProfileDataUsecase
    extends ParamUseCase<VerifyLoginEntity, ChangeProfileDataParams> {
  final ProfileRepository repository;
  ChangeProfileDataUsecase({required this.repository});
  @override
  Future<Either<Failure, VerifyLoginEntity>> execute(
      ChangeProfileDataParams params) async {
    return await repository.changeProfileData(
      address: params.address,
      birthPlace: params.birthPlace,
      dateOfBirth: params.dateOfBirth,
      gender: params.gender,
      marriageStatus: params.marriageStatus,
      motherName: params.motherName,
      name: params.name,
      nik: params.nik,
      npwp: params.npwp,
      religion: params.religion,
    );
  }
}

class ChangeProfileDataParams extends Equatable {
  final String? name;
  final String? birthPlace;
  final String? address;
  final String? dateOfBirth;
  final String? gender;
  final String? marriageStatus;
  final String? religion;
  final String? nik;
  final String? npwp;
  final String? motherName;

  const ChangeProfileDataParams({
    this.address,
    this.birthPlace,
    this.dateOfBirth,
    this.gender,
    this.marriageStatus,
    this.motherName,
    this.name,
    this.nik,
    this.npwp,
    this.religion,
  });

  @override
  List<Object?> get props => [
        address,
        birthPlace,
        dateOfBirth,
        name,
        npwp,
        nik,
        gender,
        religion,
        motherName,
        marriageStatus
      ];
}
