import 'package:aktaris_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      primaryColor: AppColors.primary,
      primarySwatch: AppColors.materialPrimary,
      indicatorColor: AppColors.accent,
      fontFamily: "Poppins",
      brightness: Brightness.light,
      inputDecorationTheme: inputDecorationTheme(),
      checkboxTheme: checkboxThemeData(),
      radioTheme: radioThemeData(),
      switchTheme: switchThemeData(),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          statusBarColor: AppColors.primary,
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      primaryColor: AppColors.primary,
      primarySwatch: AppColors.materialPrimary,
      indicatorColor: AppColors.accent,
      fontFamily: "Poppins",
      brightness: Brightness.dark,
      inputDecorationTheme: inputDecorationTheme(),
      checkboxTheme: checkboxThemeData(),
      radioTheme: radioThemeData(),
      switchTheme: switchThemeData(),
      bottomSheetTheme: const BottomSheetThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        elevation: 2,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          statusBarColor: AppColors.primary,
        ),
      ),
    );
  }

  static CheckboxThemeData checkboxThemeData() {
    return CheckboxThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      side: const BorderSide(width: 1, color: Color(0xFFCFCFCF)),
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.accent;
        }
        return null;
      }),
    );
  }

  static RadioThemeData radioThemeData() {
    return RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.accent;
        }
        return null;
      }),
    );
  }

  static SwitchThemeData switchThemeData() {
    return SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.materialAccent[200];
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return AppColors.accent;
        }
        return null;
      }),
    );
  }

  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.transparent),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.transparent),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.primary),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.primary),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static setStatusBar({
    required Brightness brightness,
    Color color = AppColors.primary,
  }) {
    final androidIconBrightness =
        brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    return SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: androidIconBrightness,
        statusBarBrightness: brightness,
        statusBarColor: color,
      ),
    );
  }
}

extension DarkMode on BuildContext {
  bool isDarkMode() {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

class AppOrientation {
  static lock(DeviceOrientation orientation) {
    return SystemChrome.setPreferredOrientations([
      orientation,
    ]);
  }
}