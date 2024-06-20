import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/app_style.dart';
import 'base/base_appbar.dart';

abstract class SkyAppBar {
  static PreferredSizeWidget primary({
    String? title,
    Color? backgroundColor,
    Color? iconColor,
    Color? shadowColor,
    List<Widget>? actions,
    Widget? leading,
    double? elevation,
    bool? centerTitle = false,
    TextStyle? titleStyle,
    PreferredSizeWidget? bottom,
  }) {
    return BaseAppBar(
      title: title,
      action: actions,
      backgroundColor: backgroundColor ?? Get.theme.scaffoldBackgroundColor,
      titleStyle: titleStyle ?? AppStyle.subtitle4.copyWith(color: AppColors.primary),
      elevation: elevation ?? 0,
      centerTitle: centerTitle,
      iconColor: iconColor ?? AppColors.systemDarkGrey,
      leading: leading,
      shadowColor: shadowColor,
      bottom: bottom,
      
    );
  }

  /// Use [SkyAppBar.secondary] as an secondary AppBar for some pages.
  /// * Can edited for specific requirement.
  static PreferredSizeWidget secondary({
    String? title,
     Widget? subtitle,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    List<Widget>? action,
    bool? centerTitle,
  }) {
    return BaseAppBar(
      title: title,
      subtitle: subtitle,
      centerTitle: centerTitle ?? true,
      action: action,
      backgroundColor: backgroundColor,
      titleStyle: TextStyle(color: textColor),
      iconColor: iconColor ?? AppColors.systemDarkGrey,
    );
  }

///
/// Add other AppBar if needed.
///
}