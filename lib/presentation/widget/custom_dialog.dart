import 'package:aktaris_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/app_style.dart';

class SkyDialog extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const SkyDialog({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Wrap(
            children: [
              Container(
                padding: padding ??
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                margin: margin ?? const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  color: (Get.isDarkMode) ? Colors.black : Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                        color:
                            (Get.isDarkMode) ? AppColors.primary : Colors.black,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 10.0)
                  ],
                ),
                child: child,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DialogAlert extends StatelessWidget {
  final String title;
  final String description;
  final String confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Widget? header;
  final Color? backgroundColorHeader;
  final Color? confirmColor;
  final Color? textColor;
  final Color? cancelColor;
  final bool isDismissible;

  const DialogAlert({
    Key? key,
    required this.title,
    required this.description,
    required this.header,
    required this.onConfirm,
    required this.backgroundColorHeader,
    required this.isDismissible,
    this.onCancel,
    this. textColor = Colors.white,
    this.confirmText = 'Ok',
    this.cancelText,
    this.confirmColor,
    this.cancelColor,
  }) : super(key: key);

  factory DialogAlert.success({
    required String title,
    required String description,
    Widget? header,

    Color? backgroundColorHeader,
    required VoidCallback onConfirm,
    required bool isDismissible,
  }) =>
      DialogAlert(
        title: title,
        description: description,
        isDismissible: isDismissible,
        header: Padding(
          padding: const EdgeInsets.all(6.0),
          child: header ?? const Icon(Icons.check_circle_outline, size: 100, color: Colors.green,),
        ),
        onConfirm: onConfirm,
       
        backgroundColorHeader:
            backgroundColorHeader ?? Get.theme.scaffoldBackgroundColor,
        confirmColor: Colors.green,
      );

  factory DialogAlert.error({
    required String title,
    required String description,
    Widget? header,
    Color? backgroundColorHeader,
    required VoidCallback onConfirm,
    required bool isDismissible,
  }) =>
      DialogAlert(
        title: title,
        description: description,
        isDismissible: isDismissible,
        header: Padding(
          padding: const EdgeInsets.all(6.0),
          child: header ?? const Icon(Icons.error, color: Colors.red,size: 100,),
        ),
        onConfirm: onConfirm,
        backgroundColorHeader:
            backgroundColorHeader ?? Get.theme.scaffoldBackgroundColor,
        confirmColor: AppColors.primary,
        
      );

  factory DialogAlert.warning({
    required String title,
    required String description,
    String? confirmText,
    String? cancelText,
    Widget? header,
    Color? backgroundColorHeader,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
    required bool isDismissible,
  }) =>
      DialogAlert(
        title: title,
        description: description,
        isDismissible: isDismissible,
        header: header ??
            Image.asset(
              'assets/icons/ic_warning.png',
              color: Colors.orange,
            ),
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmText: confirmText ?? 'Ya',
        cancelText: cancelText?? 'Tidak',
        backgroundColorHeader:
            backgroundColorHeader ?? Get.theme.scaffoldBackgroundColor,
      );

  factory DialogAlert.retry({
    required String title,
    required String description,
    String? confirmText,
    String? cancelText,
    Widget? header,
    Color? backgroundColorHeader,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
    required bool isDismissible,
  }) =>
      DialogAlert(
        title: title,
        description: description,
        confirmText: confirmText ?? 'txt_try_again'.tr,
        cancelText: cancelText,
        isDismissible: isDismissible,
        header: Padding(
          padding: const EdgeInsets.all(6),
          child: header ?? Image.asset('assets/images/ic_failed.png'),
        ),
        onConfirm: onConfirm,
        onCancel: onCancel,
        backgroundColorHeader:
            backgroundColorHeader ?? Get.theme.scaffoldBackgroundColor,
      );

  factory DialogAlert.force({
    required String title,
    required String confirmText,
    required String description,
    Widget? header,
    Color? backgroundColorHeader,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
    required bool isDismissible,
  }) =>
      DialogAlert(
        title: title,
        description: description,
        isDismissible: isDismissible,
        header: header ??
            Image.asset(
              'assets/images/ic_warning.png',
              color: Colors.orange,
            ),
        onConfirm: onConfirm,
        confirmText: confirmText,
        backgroundColorHeader:
            backgroundColorHeader ?? Get.theme.scaffoldBackgroundColor,
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => isDismissible,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Wrap(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  margin: const EdgeInsets.only(top: 26),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(17),
                      boxShadow: [
                        BoxShadow(
                            color: (Get.isDarkMode)
                                ? AppColors.primary
                                : Colors.black,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 10.0)
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 64),
                      Text(
                        title,
                        style: AppStyle.subtitle3.copyWith(
                          fontWeight: AppStyle.semiBold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 32),
                      SkyButton(
                        text: confirmText,
                        textColor: textColor,
                        color: confirmColor ?? AppColors.primary,
                        onPressed: onConfirm,
                        fontWeight: AppStyle.semiBold,
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: (onCancel != null),
                        child: SkyButton(
                          text: cancelText ?? 'txt_no'.tr,
                          fontWeight: AppStyle.semiBold,
                          color: cancelColor ?? AppColors.primary,
                          onPressed: onCancel,
                          outlineMode: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 16,
              right: 16,
              child: CircleAvatar(
                backgroundColor: backgroundColorHeader,
                radius: 50,
                child: header,
              ),
            )
          ],
        ),
      ),
    );
  }
}