import 'package:aktaris_app/config/auth/auth_state.dart';
import 'package:aktaris_app/config/theme/theme_manager.dart';
import 'package:aktaris_app/core/database/get_storage.dart';
import 'package:aktaris_app/data/model/auth/auth_model.dart';
import 'package:aktaris_app/presentation/ui/bottom_navbar/navbar_component.dart';
import 'package:get/get.dart';

import '../../core/database/get_storage/get_storage_key.dart';
import '../../core/database/get_storage/get_storage_manager.dart';
import '../../core/database/secure_storage/secure_storage_manager.dart';

class AuthManager extends GetxService {
  static AuthManager get find => Get.find<AuthManager>();

  Rxn<AuthState> authState = Rxn<AuthState>();
  Stream<AuthState?> get stream => authState.stream;
  AuthState? get state => authState.value;

  GetStorageManager getStorage = GetStorageManager.find;
  SecureStorageManager secureStorage = SecureStorageManager.find;
  ThemeManager themeManager = ThemeManager.find;

  bool get isAuthenticated => state?.appStatus == AppType.AUTHENTICATED;
  bool get isUnauthenticated => state?.appStatus == AppType.UNAUTHENTICATED;

  @override
  void onInit() {
    authState.value = const AuthState(appStatus: AppType.INITIAL);
    super.onInit();
  }

  @override
  void onReady() async {
    ever(authState, authChanged);
    authChanged(state);
    super.onReady();
  }

  void authChanged(AuthState? state) async {
    switch (state?.appStatus) {
      case AppType.INITIAL:
        await setup();
        break;
      case AppType.FIRST_INSTALL:
        // Timer(
        //   const Duration(seconds: 2),
        //   () => Get.offAllNamed(IntroView.route),
        // );
        break;
      case AppType.UNAUTHENTICATED:
        // Timer(
        //   const Duration(seconds: 2),
        //   () => Get.offAllNamed(LoginView.route),
        // );
        break;
      case AppType.AUTHENTICATED:
        Get.offAllNamed(BottomNavBarComponent.routeName);
        break;
      default:
      // Get.toNamed(SplashView.route);
    }
  }

  Future<void> setup() async {
    checkFirstInstall();
    await checkAppTheme();
  }

  /// Check if app is first time installed. It will navigate to Introduction Page
  void checkFirstInstall() async {
    final bool isFirstInstall =
        await getStorage.getAwait(GetStorageKey.FIRST_INSTALL) ?? true;
    if (isFirstInstall) {
      await secureStorage.setToken(value: '');
      authState.value = const AuthState(appStatus: AppType.FIRST_INSTALL);
    } else {
      checkUser();
    }
  }

  /// Checking App Theme set it before app display
  Future<void> checkAppTheme() async {
    final bool isDarkTheme =
        await getStorage.getAwait(GetStorageKey.IS_DARK_THEME) ?? false;
    if (isDarkTheme) {
      themeManager.toDarkMode();
    } else {
      themeManager.toLightMode();
    }
  }

  /// This function to used for checking is valid token to API Server use GET User Endpoint (token required).
  /// If response is Error it will passed to [logout] process.
  Future<void> checkUser() async {
    // TODO : Add your logic check user here
    final String? token = await secureStorage.getToken();
    if (token != null && token != '') {
      setAuth();
    } else {
      logout();
    }
  }

  /// Set auth state to AppType.AUTHENTICATED
  void setAuth() async {
    if (await secureStorage.isLoggedIn()) {
      authState.value = const AuthState(appStatus: AppType.AUTHENTICATED);
    }
  }

  /// Just call this function to managed logout process.
  /// It will stream state and auto redirect your apps to page based on their state
  /// with [authChanged] function
  /// * No need to navigate manually (Get.to or Get.off)
  Future<void> logout() async {
    await clearData();
    // Get.offAllNamed(LoginPage.routeName);
    authState.value = const AuthState(appStatus: AppType.UNAUTHENTICATED);
  }

  Future<void> clearData() async {
    await secureStorage.logout();
    getStorage.logout();
  }

  /// Just call this function to managed login process.
  /// It will stream state and auto redirect your apps to page based on their state
  /// with [authChanged] function
  /// * No need to navigate manually (Get.to or Get.off).
  Future<void> login({
    required user,
    required String? token,
    required String? refreshToken,
  }) async {
    await saveAuthData(user: user, token: token, refreshToken: refreshToken);
    setAuth();
  }

  Future<void> saveAuthData({
    required AuthModel user,
    String? token,
    String? refreshToken,
  }) async {
    await saveUserData(user: user);
    LocalStorage.to.saveToken(token!);
    LocalStorage.to.saveToken(refreshToken!);
  }

  Future<void> saveUserData({required AuthModel user}) async {
    await getStorage.save(GetStorageKey.USERS, user.toJson());
  }

  /// Get User data from GetStorage
  /// * No need to decode or call fromJson again when you used this helper
  User? get user {
    if (getStorage.has(GetStorageKey.USERS)) {
      return User.fromJson(getStorage.get(GetStorageKey.USERS));
    } else {
      return null;
    }
  }
}
