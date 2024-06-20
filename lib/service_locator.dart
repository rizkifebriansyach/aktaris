import 'dart:io';

import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/core/database/shared_prefs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/app/app_info.dart';
import 'config/auth/auth_manager.dart';
import 'config/network/api_config.dart';
import 'config/theme/theme_manager.dart';
import 'core/database/get_storage/get_storage_key.dart';
import 'core/database/get_storage/get_storage_manager.dart';
import 'core/database/secure_storage/secure_storage_manager.dart';

class ServiceLocator {
  static Future<void> init() async {
    if (kReleaseMode) debugPrint = (String? message, {int? wrapWidth}) {};
    await _initConfig();
    await _initService();
    AppInfo.setInfo(await PackageInfo.fromPlatform());
  }

  static Future<void> _initConfig() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isIOS) {
      final dir = await getLibraryDirectory();
      await Get.putAsync(
        () async => GetStorage(GetStorageKey.STORAGE_NAME, dir.path),
      );
      await GetStorage(GetStorageKey.STORAGE_NAME, dir.path).initStorage;
    } else {
      await Get.putAsync(() async => GetStorage());
      await GetStorage(GetStorageKey.STORAGE_NAME).initStorage;
    }

    Get.putAsync(() async => const FlutterSecureStorage());
    Get.lazyPut(() => DioClientAuth());
    Get.lazyPut(() => DioClientRocket());
  }

  static Future<void> _initService() async {
    Get.lazyPut(() => GetStorageManager());
    Get.lazyPut(() => SecureStorageManager());
    Get.put(LocalStorage());
    Get.putAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance(),
        permanent: true);
    Get.lazyPut(() => ThemeManager());
    // Get.lazyPut(() => LocaleManager());
    Get.put(AuthManager());
  }
}
