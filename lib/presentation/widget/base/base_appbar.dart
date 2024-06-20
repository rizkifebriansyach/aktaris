import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/theme/app_colors.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    Key? key,
    this.title,
    this.subtitle,
    this.action,
    this.backgroundColor,
    this.centerTitle = false,
    this.titleStyle,
    this.iconColor,
    this.elevation,
    this.leading,
    this.height,
    this.iconSize,
    this.shadowColor,
    this.bottom,
  }) : super(key: key);

  final String? title;
  final Widget? subtitle;
  final Color? backgroundColor;
  final List<Widget>? action;
  final bool? centerTitle;
  final Color? iconColor;
  final TextStyle? titleStyle;
  final double? elevation;
  final double? height;
  final double? iconSize;
  final Widget? leading;
  final Color? shadowColor;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light
      ),
      centerTitle: centerTitle,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: titleStyle,
          ),
          subtitle ?? const SizedBox()
        ],
      ),
      backgroundColor: backgroundColor,
      elevation: elevation,
      actions: action,
      leading: leading ,
      shadowColor: shadowColor,
      iconTheme: IconThemeData(color: iconColor, size: iconSize),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}