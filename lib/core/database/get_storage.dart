import 'package:aktaris_app/data/model/auth/auth_model.dart';
import 'package:aktaris_app/data/model/auth/register_model.dart';
import 'package:aktaris_app/data/model/notaris_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class KeyBox {
  static const String token = "token";
  static const String refreshToken = "refresh-token";
  static const String user = "user";
  static const String regisData = "regis-data";
  static const String userIdNotaris = "userid-notaris";
}

class LocalStorage {
  static LocalStorage get to => Get.find<LocalStorage>();

  final userBox = GetStorage("userBox");
  final authBox = GetStorage("authBox");
  final registerBox = GetStorage("registerBox");
  final notarisBox = GetStorage("notarisBox");

  // -------<Credential Storage>-------
  void saveToken(String token) => authBox.write(KeyBox.token, token);
  void saveRefreshToken(String refreshToken) =>
      authBox.write(KeyBox.refreshToken, refreshToken);
  String? getToken() => authBox.read(KeyBox.token);
  String? getRefreshToken() => authBox.read(KeyBox.refreshToken);
  bool isLoggedIn() => authBox.hasData(KeyBox.token);

  // -------<User Data Storage>-------
  void saveUser(AuthModel user) => userBox.write(KeyBox.user, user.toJson());
  bool isEmptyUser() => !(userBox.hasData(KeyBox.user));
  AuthModel? getUser() {
    final user = userBox.read(KeyBox.user);
    if (user != null) {
      return AuthModel.fromJson(userBox.read(KeyBox.user));
    }
    return null;
  }

  // -------<Register Data Storage>-------
  void saveRegisterData(RegisterModel? register) =>
      registerBox.write(KeyBox.regisData, register?.toJson());
  bool isEmptyRegisData() => !(registerBox.hasData(KeyBox.regisData));
  RegisterModel? getRegisData() {
    final regisData = registerBox.read(KeyBox.regisData);
    if (regisData != null) {
      return RegisterModel.fromJson(registerBox.read(KeyBox.regisData));
    }
    return null;
  }

   // -------<Notaris user id>-------
   void saveDetailsNotaris(NotarisDetails? userId)=> notarisBox.write(KeyBox.userIdNotaris, userId);
   NotarisDetails? getDetailsNotaris()=> notarisBox.read(KeyBox.userIdNotaris);
   


  logout() async => clearAllBox();

  void clearAllBox() async {
    try {
      await authBox.erase();
      
      // await userBox.erase();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}