import 'package:aktaris_app/config/network/api_request.dart';
import 'package:aktaris_app/config/network/api_response.dart';

import '../../model/auth/auth_model.dart';

abstract class ProfileRemoteDatasource {
  Future<String> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  Future<AuthModel> changeProfileData({
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

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  @override
  Future<String> changePassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      final response =
          await ApiRequest.post(url: 'reset-password/', useToken: true, body: {
        "pass_old": oldPassword,
        "pass_new": newPassword,
      });
      return "Berhasil mengubah kata sandi";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> changeProfileData(
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
      final response =
          await ApiRequest.post(url: "update-profile", useToken: true, body: {
        "name": name,
        "place_of_birth": birthPlace,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "marriage_status": marriageStatus,
        "no_nik": nik,
        "no_npwp": npwp,
        "address": address,
        "agama": religion,
        "ibu_kandung": motherName,
      });
      return AuthModel.fromJson(ApiResponse.fromJson(response.data).data);
    } catch (e) {
      rethrow;
    }
  }
}
