// ignore_for_file: unused_import

import 'package:aktaris_app/data/model/auth/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

FlutterSecureStorage secureStorage = Get.find<FlutterSecureStorage>();

class SecureStorageManager {
  static SecureStorageManager get find => Get.find<SecureStorageManager>();

  final String _tokenKey = 'token';
  final String _refreshTokenKey = 'refresh_token';
  final String _usernameUser = 'username_user';

  Future<bool> isLoggedIn() async {
    return (await getToken() != '');
  }

  Future<String?> getToken() async {
    var tokenKey = await secureStorage.read(key: _tokenKey);
    debugPrint("TOKEN KEY : $tokenKey");
    return await secureStorage.read(key: _tokenKey);
    
  }

  Future setToken({required String? value}) async {
    return await secureStorage.write(key: _tokenKey, value: value);
  }

  Future<String?> getRefreshToken() async {
    return await secureStorage.read(key: _refreshTokenKey);
  }

  Future setRefreshToken({required String? value}) async {
    return await secureStorage.write(key: _refreshTokenKey, value: value);
  }

  Future setUsernameUser({required String? value})async{
    return await secureStorage.write(key: _usernameUser, value: value);
  }

  Future<String?> getUsernameUser()async{
    return await secureStorage.read(key: _usernameUser);
  }

  Future logout() async {
    await setToken(value: '');
    await setRefreshToken(value: '');
  }
}