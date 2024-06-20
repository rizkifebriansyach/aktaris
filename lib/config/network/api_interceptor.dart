import 'dart:convert';

import 'package:aktaris_app/config/network/api_config.dart';
import 'package:aktaris_app/config/network/api_request.dart';
import 'package:aktaris_app/config/network/api_response.dart';
import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/core/database/secure_storage/secure_storage_manager.dart';
import 'package:aktaris_app/core/helper/dialog_helper.dart';
import 'package:aktaris_app/presentation/ui/auth/login/login_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

final class ApiInterceptors extends InterceptorsWrapper {
  ApiInterceptors(this._dio);
  final Dio _dio;

  @override
  Future<dynamic> onRequest(options, handler) async {
    if (kDebugMode) {
      debugPrint('');
      debugPrint('# REQUEST');
      debugPrint('--> ${options.method.toUpperCase()} - ${options.uri}');
      debugPrint('Headers: ${options.headers}');
      debugPrint('Query Params: ${options.queryParameters}');
      debugPrint('Body: ${options.data}');
      if (options.contentType == 'multipart/form-data') {
        debugPrint('Data: ${options.data.fields}');
      }
      debugPrint('--> END ${options.method.toUpperCase()}');
    }
    return handler.next(options);
  }

  @override
  Future<dynamic> onResponse(response, handler) async {
    if (kDebugMode) {
      debugPrint('');
      debugPrint('# RESPONSE');
      debugPrint('<-- ${(response.requestOptions.uri)}');
      debugPrint('Status Code : ${response.statusCode} ');
      debugPrint('Headers: ${response.headers}');
      debugPrint('Response: ${response.data}');
      debugPrint('<-- END HTTP');
    }
    return super.onResponse(response, handler);
  }

  @override
  Future<dynamic> onError(DioException err, handler) async {
    // if (kDebugMode) {
    debugPrint('');
    debugPrint('# ERROR');
    debugPrint('<-- ${err.response?.requestOptions.baseUrl}');
    debugPrint('Status Code : ${err.response?.statusCode} ');
    debugPrint('Error Message : ${err.response?.data} ');
    debugPrint('Error Message Data : ${err.response?.data} ');
    debugPrint('Error Message : ${err.message} ');
    debugPrint('Error Response Message : ${err.response?.statusMessage} ');
    debugPrint('Response Path : ${err.response?.requestOptions.uri}');
    debugPrint('<-- End HTTP');

    String? accesToken = LocalStorage.to.getToken();
    String? refreshToken = LocalStorage.to.getRefreshToken();
    debugPrint("REFRESH TOKEN : $refreshToken");

    if (accesToken != null && err.response?.statusCode == 401) {
      String? newToken =
          await getAccessToken(refreshToken: refreshToken.toString());
      LocalStorage.to.saveToken(newToken!);
      return handler.resolve(await retry(err.requestOptions));
    } else if (accesToken == null && err.response?.statusCode == 401) {
      return DialogHelper.failed(
        title: "Gagal",
        message: "Anda harus login kembali! cuyyy",
        onConfirm: () => Get.offAllNamed(LoginPage.routeName),
      );
    }
    return super.onError(err, handler);

    // }
    // handleToken(
    //   dio: _dio,
    //   err: err,
    //   handler: handler,
    // );
    // throw err;
  }

  Future<dynamic> retry(RequestOptions requestOptions) async {
    var newAccessToken = LocalStorage.to.getToken();
    final options = Options(
        method: requestOptions.method,
        headers: {"Authorization": "Bearer $newAccessToken"});
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<dynamic> getAccessToken({required String refreshToken}) async {
    try {
      final responseBody = await Dio().post(
        '${DioClientAuth.authBaseURL}auth/refresh-token',
        data: jsonEncode({"refresh_token": refreshToken}),
        options:
            Options(headers: headers, contentType: Headers.jsonContentType),
      );
      return ApiResponse.fromJson(responseBody.data)
          .data["access_token"]
          .toString();
    } on DioException catch (error) {
      debugPrint("$error");
      return DialogHelper.failed(
        title: "Gagal",
        message: "Anda harus login kembali! cuyyy",
        onConfirm: () => Get.offAllNamed(LoginPage.routeName),
      );
      // AppDialog.show(
      //     typeDialog: TypeDialog.FAILED,
      //     dismissible: false,
      //     message: "Anda harus login kembali!",
      //     onPress: () => getx.Get.offAllNamed(LoginPage.routeName));
    }
  }
}
