// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';
import 'package:aktaris_app/config/network/api_config.dart';
import 'package:aktaris_app/config/network/api_exceptions.dart';
import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/core/database/shared_prefs.dart';
import 'package:aktaris_app/core/error/exception.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/database/secure_storage/secure_storage_manager.dart';

Map<String, String> headers = {
  HttpHeaders.authorizationHeader: '',
};

Map<String, String> headersRocketChat = {
  HttpHeaders.authorizationHeader: '',
  "X-Auth-Token": prefs.getString(KeyPrefs.xAuthToken)!,
  "X-User-Id": prefs.getString(KeyPrefs.xUserId)!,
};

/// Base Request for calling API.
/// * Can be modify as needed.
class ApiRequest {
  static final _networkUtils = NetworkUtilsRequest();
  static Future<Response> post({
    required String url,
    bool useToken = false,
    bool? rocketChatRequest = false,
    // bool? quotaRequest = false,
    // bool? stampRequest = false,
    Map<String, dynamic> headers = const {
      HttpHeaders.authorizationHeader: '',
    },
    String? contentType = Headers.jsonContentType,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    (rocketChatRequest == false)
        ? await _networkUtils.tokenManager(useToken)
        : _networkUtils.tokenManagerRocket(useToken);
    return await _networkUtils.safeFetch(() {
      try {
        return (rocketChatRequest == false)
            ? DioClientAuth.find.post(
                url,
                data: _networkUtils.setBody(
                  contentType: contentType,
                  body: body,
                ),
                options: Options(
                  headers: headers,
                  contentType: contentType,
                ),
                queryParameters: queryParameters,
                cancelToken: CancelToken(),
              )
            : DioClientRocket.find.post(
                url,
                data: _networkUtils.setBody(
                  contentType: contentType,
                  body: body,
                ),
                options: Options(
                  headers: headersRocketChat,
                  contentType: contentType,
                ),
                queryParameters: queryParameters,
                cancelToken: CancelToken(),
              );
      } catch (e) {
        debugPrint(e.toString());
      }
      // return Response(requestOptions: RequestOptions()) ;
      return Future.error("");
    });
  }

  static Stream<Response> postStream({
    required String url,
    bool useToken = false,
    bool? quotaRequest = false,
    bool? stampRequest = false,
    String? contentType = Headers.jsonContentType,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) async* {
    await _networkUtils.tokenManager(useToken);
    yield await _networkUtils.safeFetch(() {
      try {
        return DioClientAuth.find.post(
          url,
          data: _networkUtils.setBody(contentType: contentType, body: body),
          options: Options(headers: headers, contentType: contentType),
          queryParameters: queryParameters,
          cancelToken: CancelToken(),
        );
      } catch (e) {
        debugPrint(e.toString());
      }
      // return Response(requestOptions: RequestOptions()) ;
      return Future.error("");
    });
  }

  static Future<Response> get({
    required String url,
    bool useToken = true,
    bool? quotaRequest = false,
    bool? stampRequest = false,
    Object? body,
    String? contentType = Headers.jsonContentType,
    Map<String, dynamic>? queryParameters,
  }) async {
    await _networkUtils.tokenManager(useToken);
    return await _networkUtils.safeFetch(
      () => DioClientAuth.find.get(
        url,
        data: _networkUtils.setBody(contentType: contentType, body: body),
        options: Options(headers: headers, contentType: contentType),
        queryParameters: queryParameters,
        cancelToken: CancelToken(),
      ),
    );
  }

  static Stream<Response> getStream({
    required String url,
    bool useToken = true,
    bool? quotaRequest = false,
    bool? stampRequest = false,
    Object? body,
    String? contentType = Headers.jsonContentType,
    Map<String, dynamic>? queryParameters,
  }) async* {
    await _networkUtils.tokenManager(useToken);
    yield await _networkUtils.safeFetch(
      () => DioClientAuth.find.get(
        url,
        data: _networkUtils.setBody(contentType: contentType, body: body),
        options: Options(headers: headers, contentType: contentType),
        queryParameters: queryParameters,
        cancelToken: CancelToken(),
      ),
    );
  }
}

final class NetworkUtilsRequest with NetworkException {
  Object? setBody({
    required String? contentType,
    required Object? body,
  }) {
    if (contentType == Headers.jsonContentType) {
      return body = jsonEncode(body);
    } else if (contentType == Headers.formUrlEncodedContentType) {
      return body;
    } else if (contentType == Headers.multipartFormDataContentType) {
      (body as Map<String, dynamic>).removeWhere((k, v) => v == null);
      return FormData.fromMap(body);
    } else {
      return null;
    }
  }

  Future<void> tokenManager(bool useToken) async {
    DioClientAuth.setInterceptor();
    String? token = LocalStorage.to.getToken();
    if (useToken) {
      headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    } else {
      headers.clear();
    }
  }

  Future<void> tokenManagerRocket(bool useToken) async {
    DioClientRocket.setInterceptor();
    String? token = LocalStorage.to.getToken();
    if (useToken) {
      headersRocketChat[HttpHeaders.authorizationHeader] = 'Bearer $token';
    } else {
      headers.clear();
    }
  }

  Future<Response> safeFetch(Future<Response> Function() tryFetch) async {
    try {
      final response = await tryFetch();
      // Check if response indicates an error
      if (response.statusCode != 200) {
        throw Exception(
            'Request failed with status code ${response.statusCode}');
      }
      return response;
    } on ServerException catch (e) {
      // Handle socket exceptions separately (e.g., network issues)
      throw getErrorException('SocketException: $e');
    } on DioException catch (e) {
      // Handle Dio errors (e.g., HTTP errors)
      throw getErrorException(e);
    } on Exception catch (e) {
      // Handle other generic exceptions
      throw getErrorException('An error occurred: $e');
    }
    // try {
    //   final response = await tryFetch();
    //   // return ApiResponse.fromJson(response.data);
    //   return response;
    // } on Exception catch (e, stackTrace) {
    //   debugPrint('Api Request -> $e, $stackTrace');
    //   throw getErrorException(e);
    // } catch (e, stackTrace) {
    //   debugPrint('Api Request2 -> $e, $stackTrace');
    //   rethrow;
    // }
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
