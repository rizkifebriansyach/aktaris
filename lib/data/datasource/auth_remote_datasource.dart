import 'package:aktaris_app/config/network/api_request.dart';
import 'package:aktaris_app/config/network/api_response.dart';
import 'package:aktaris_app/data/model/auth/auth_model.dart';
import 'package:aktaris_app/data/model/auth/login_model.dart';
import 'package:aktaris_app/data/model/auth/register_model.dart';
import 'package:flutter/material.dart';

abstract class AuthRemoteDatasource {
  Future<RegisterModel> register({
    required String phoneNumber,
    required String email,
    required String password,
  });

  Future<String> verifyRegister({
    required int userId,
    required String otpCode,
  });

  Future<LoginModel> login({
    required String email,
    required String password,
  });

  Future<AuthModel> verifyLogin({
    required int userId,
    required String otpCode,
  });

  Future<LoginModel> resendLoginOtp({required int userId});

  Future<LoginModel> resendRegisterOtp({required int userId});

  Future<String> resetPassword({required String email});
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  String tag = 'Auth Api';
  @override
  Future<RegisterModel> register({
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiRequest.post(
        url: 'auth/register/',
        body: {
          "phone_number": phoneNumber,
          "email": email,
          "password": password,
        },
      );
      return RegisterModel.fromJson(ApiResponse.fromJson(response.data).data);
    } catch (e, stack) {
      debugPrint('$tag Error = $e, $stack');
      rethrow;
    }
  }

  @override
  Future<String> verifyRegister({
    required int userId,
    required String otpCode,
  }) async {
    try {
      final response = await ApiRequest.post(
        url: "auth/register/verify-email",
        body: {
          "user_id": userId,
          "otpcode": otpCode,
        },
      );
      return ApiResponse.fromJson(response.data).data['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiRequest.post(url: "auth/login", body: {
        "email": email,
        "password": password,
      });
      return LoginModel.fromJson(ApiResponse.fromJson(response.data).data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> verifyLogin({
    required int userId,
    required String otpCode,
  }) async {
    try {
      final response = await ApiRequest.post(
          url: "auth/verify-login",
          useToken: true,
          body: {
            "user_id": userId,
            "otpcode": otpCode,
          });
      return AuthModel.fromJson(ApiResponse.fromJson(response.data).data);
    } catch (e) {
      debugPrint("Error verifyLogin $tag $e");
      rethrow;
    }
  }

  @override
  Future<LoginModel> resendLoginOtp({required int userId}) async {
    try {
      final response = await ApiRequest.post(
        url: "auth/resend-otp",
        body: {
          "user_id": userId,
        },
      );
      return LoginModel.fromJson(ApiResponse.fromJson(response.data).data);
    } catch (e) {
      debugPrint("Error resend OTP Login $tag $e");
      rethrow;
    }
  }

  @override
  Future<LoginModel> resendRegisterOtp({required int userId}) async {
    try {
      final response = await ApiRequest.post(
        url: "auth/register/resend-otp",
        body: {
          "user_id": userId,
        },
      );
      return LoginModel.fromJson(ApiResponse.fromJson(response.data).data);
    } catch (e) {
      debugPrint("Error resend OTP register $tag $e");
      rethrow;
    }
  }

  @override
  Future<String> resetPassword({required String email}) async {
    try {
      final response =
          await ApiRequest.post(url: "reset-password/send-email", body: {
        "email": email,
      });
      return ApiResponse.fromJson(response.data).data["message"];
    } catch (e) {
      debugPrint("Error reset password $tag $e");
      rethrow;
    }
  }
}
