import 'package:get/get.dart';

import '../../core/database/get_storage/get_storage_key.dart';
import '../../core/database/get_storage/get_storage_manager.dart';

class ThemeManager extends GetxService {
  static ThemeManager get find => Get.find<ThemeManager>();

  RxBool isDark = false.obs;
  void toDarkMode() => isDark.value = true;
  void toLightMode() => isDark.value = false;

  @override
  void onReady() async {
    isDark.value = await GetStorageManager.find.getAwait(GetStorageKey.IS_DARK_THEME) ?? false;
    super.onReady();
  }

  Future<Rx<bool>> changeTheme() async {
    if (isDark.isTrue) {
      GetStorageManager.find.save(GetStorageKey.IS_DARK_THEME, false);
    } else {
      GetStorageManager.find.save(GetStorageKey.IS_DARK_THEME, true);
    }
    return isDark.toggle();
  }
}