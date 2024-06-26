import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/app_style.dart';

class SkyButton extends StatelessWidget {
  /// Background color of button. Default value is primary color.
  final Color color;

  /// Text color of button, default value is white.
  final Color? textColor;

  /// Text color of button, default value is white.
  final Color? borderColor;

  /// Text color of leading icon, default value is white.
  final Color? iconColor;

  /// Action or function that called when button pressed.
  final VoidCallback? onPressed;

  /// Display text in button.
  final String? text;

  /// Width shape of button
  final double? height;

  /// Width shape of button, default value is match parent.
  final double? width;

  final double? borderWidth;

  /// The size of text button.
  final double? fontSize;

  /// Border radius of the button
  final BorderRadiusGeometry? borderRadius;

  /// The radius of the button shape.
  final double radiusValue;

  /// Elevation value of button.
  final double? elevation;

  /// Leading icon inside button.
  final IconData? icon;

  /// Leading icon with Widget
  final Widget? leading;

  /// Font weight text and icon inside button.
  final FontWeight? fontWeight;

  final EdgeInsetsGeometry? margin;

  final EdgeInsetsGeometry? padding;

  /// Width of button
  final bool wrapContent;

  /// Change style button to outline mode
  final bool outlineMode;

  /// Widget inside the button
  final Widget? child;

  /// the option to change button color
  final Gradient? gradient;

  /// wether the button is can be clicked or not
  final bool enabled;

  const SkyButton({
    Key? key,
    this.text,
    this.onPressed,
    this.icon,
    this.color = AppColors.primary,
    this.iconColor,
    this.textColor,
    this.height = 48,
    this.width = double.infinity,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.elevation,
    this.margin,
    this.padding,
    this.wrapContent = false,
    this.borderColor,
    this.borderWidth,
    this.leading,
    this.outlineMode = false,
    this.radiusValue = 8,
    this.child,
    this.gradient,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (wrapContent) ? null : width,
      height: (wrapContent) ? null : height,
      margin: margin,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius ?? BorderRadius.circular(radiusValue),
      ),
      child: ElevatedButton.icon(
        icon: Visibility(
          visible: (leading != null || icon != null),
          child: leading ??
              Icon(
                icon,
                color: iconColor ?? ((outlineMode) ? color : Colors.white),
              ),
        ),
        onPressed: (enabled) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: gradient != null
              ? Colors.transparent
              : (outlineMode)
                  ? Theme.of(context).scaffoldBackgroundColor
                  : color,
          padding: (icon != null || leading != null)
              ? const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
              : const EdgeInsets.fromLTRB(0, 10, 10, 10),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(radiusValue),
            side: BorderSide(
              color: enabled
                  ? (outlineMode)
                      ? borderColor ?? color
                      : borderColor ?? Colors.transparent
                  : Colors.transparent,
              width: borderWidth ?? 1.5,
              style: BorderStyle.solid,
            ),
          ),
        ),
        label: Container(
          padding: padding,
          child: FittedBox(
            fit: BoxFit.none,
            child: child ??
                Text(
                  text ?? ' ',
                  textAlign: TextAlign.center,
                  style: AppStyle.subtitle4.copyWith(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    fontFamily: "Poppins",
                    color: (!enabled)
                        ? Colors.grey.shade400
                        : textColor ?? (outlineMode ? color : textColor),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.iconColor,
    this.iconSize,
    this.minWidth,
    this.background,
    this.border,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final double? minWidth;
  final Color? background;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        border: border,
      ),
      child: IconButton(
        onPressed: onPressed,
        splashColor: Colors.transparent,
        splashRadius: (minWidth ?? 45) - 25,
        iconSize: iconSize ?? 22,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: minWidth ?? 45,
          minHeight: minWidth ?? 45,
        ),
        icon: Icon(
          icon,
          color: iconColor ?? Theme.of(context).appBarTheme.iconTheme?.color,
        ),
      ),
    );
  }
}