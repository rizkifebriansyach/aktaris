import 'dart:convert';

import 'package:aktaris_app/config/network/api_config.dart';
import 'package:aktaris_app/config/network/api_exceptions.dart';
import 'package:aktaris_app/config/network/api_request.dart';
import 'package:aktaris_app/config/network/api_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/database/secure_storage/secure_storage_manager.dart';
import '../../core/helper/dialog_helper.dart';
import '../auth/auth_manager.dart';
import '../env/app_env.dart';

enum TokenType {
  /// When your app no need token authentication.
  NONE,

  /// When your app just use Access Token.
  ACCESS_TOKEN,

  /// When your app use Refresh Token Mechanism (Access + Refresh).
  REFRESH_TOKEN,
}

abstract class ApiTokenManager extends QueuedInterceptorsWrapper
    with NetworkException {
  final authManager = AuthManager.find;
  final secureStorage = SecureStorageManager.find;

  Future<void> handleToken({
    required Dio dio,
    required DioException err,
    required ErrorInterceptorHandler handler,
  }) async {
    switch (AppEnv.config.tokenType) {
      case TokenType.NONE:
        super.onError(err, handler);
        break;
      case TokenType.ACCESS_TOKEN:
        // super.onError(err, handler);
        _handleAccessToken(err, handler);
        break;
      case TokenType.REFRESH_TOKEN:
        _handleRefreshToken(dio, err, handler);
        break;
    }
  }

  void _handleAccessToken(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final int status = err.response?.statusCode ?? 0;
    if (status == 401) {
      // DialogHelper.failed(
      //   title: 'Gagal',
      //   isDismissible: false,
      //   message: 'Anda harus login kembali',
      //   onConfirm: () => authManager.logout(),
      // );
      super.onError(err, handler);
    } else {
      super.onError(err, handler);
    }
  }

  void _handleRefreshToken(
    Dio dio,
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    String? accessToken = await secureStorage.getToken();
    String? refreshToken = await secureStorage.getRefreshToken();
    debugPrint('Refresh Token : $refreshToken');
    debugPrint('Access Token : $accessToken');
    if (accessToken != null && err.response?.statusCode == 401) {
      String? newToken =
          await _getAccessToken(refreshToken: refreshToken.toString());
      await secureStorage.setToken(value: newToken.toString());
      return handler.resolve(await _retry(dio, err.requestOptions));
    } else if(accessToken == null && err.response?.statusCode == 401){
       DialogHelper.failed(
        title: 'Gagal',
        isDismissible: false,
        message: 'Anda harus login kembali',
        onConfirm: () => authManager.logout(),
      );
      super.onError(err, handler);
    }
  }

  Future<dynamic> _getAccessToken({required String refreshToken}) async {
    try {
      final responseBody = await Dio().post(
        '${DioClientAuth.authBaseURL}api/auth/refresh-token',
        data: jsonEncode({'refresh_token': refreshToken}),
        options:
            Options(headers: headers, contentType: Headers.jsonContentType),
      );
      // LoadingDialog.dismiss();
      debugPrint('response refresh token : $responseBody');
      if (responseBody.data is Map && responseBody.data.containsKey('data')) {
        final data = responseBody.data['data'];
        if (data is Map && data.containsKey('access_token')) {
          return data['access_token'];
        }
      }
      return ApiResponse.fromJson(responseBody.data).data['access_token'];
    } on DioException catch (error) {
      debugPrint(getErrorException(error).toString());
      return DialogHelper.failed(
        isDismissible: false,
        title: 'Gagal',
        message: 'Anda harus login kembali',
        onConfirm: () => authManager.logout(),
      );
    }
  }

  Future<Response<dynamic>> _retry(
    Dio dio,
    RequestOptions requestOptions,
  ) async {
    String newAccessToken = await secureStorage.getRefreshToken() ?? '';
    final options = Options(
      method: requestOptions.method,
      headers: {'Authorization': 'Bearer $newAccessToken'},
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
