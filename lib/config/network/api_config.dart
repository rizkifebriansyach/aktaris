
import 'package:aktaris_app/config/env/app_env.dart';
import 'package:aktaris_app/config/network/api_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioClientAuth extends GetxService {
  static String authBaseURL = AppEnv.config.authBaseUrl;

  late Dio _dio;
  static Dio get find => Get.find<DioClientAuth>()._dio;

  @override
  void onInit() {
    _dio = Dio();
    _dio.options.baseUrl = authBaseURL;
    _dio.options.connectTimeout = const Duration(seconds: 30); //60s
    _dio.options.receiveTimeout = const Duration(seconds: 30); //60s
    super.onInit();
  }

  static void setInterceptor() {
    DioClientAuth.find.interceptors.clear();
    DioClientAuth.find.interceptors.add(ApiInterceptors(DioClientAuth.find));
  }
}

class DioClientRocket extends GetxService {
  static String rocketBaseUrl = AppEnv.config.rocketBaseUrl!;

  late Dio _dio;
  static Dio get find => Get.find<DioClientRocket>()._dio;

  @override
  void onInit() {
    _dio = Dio();
    _dio.options.baseUrl = rocketBaseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30); //60s
    _dio.options.receiveTimeout = const Duration(seconds: 30); //60s
    super.onInit();
  }

  static void setInterceptor() {
    DioClientRocket.find.interceptors.clear();
    DioClientRocket.find.interceptors.add(ApiInterceptors(DioClientRocket.find));
  }
}