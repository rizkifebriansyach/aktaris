import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/app_style.dart';

class SkyFormField extends StatelessWidget {
  final String? label, hint, endText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final IconData? icon;
  final Widget? endIcon;
  final int? maxLength, maxLines;
  final VoidCallback? onPress;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? hintColor;
  final bool readOnly;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final bool validate;
  final String? initialValue;
  final Widget? prefixWidget;
  final bool disableBorder;
  final bool? enabled;
  final InputBorder? disabledBorder;
  final TextStyle? style;
  final TextStyle? hintStyle;

  const SkyFormField({
    Key? key,
    this.label,
    this.hint,
    this.maxLength,
    this.maxLines = 1,
    this.onPress,
    this.endIcon,
    this.validator,
    this.controller,
    this.keyboardType,
    this.icon,
    this.backgroundColor,
    this.textColor = Colors.grey,
    this.hintColor = Colors.grey,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.initialValue,
    this.onChanged,
    this.readOnly = false,
    this.validate = false,
    this.enabled,
    this.endText,
    this.disableBorder = false,
    this.prefixWidget,
    this.disabledBorder,
    this.style,
    this.hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> formatters = [];
    formatters.add(LengthLimitingTextInputFormatter(maxLength));
    if (inputFormatters != null) {
      formatters.addAll(inputFormatters!);
    }

    /// Make controller and initial value can initialize in the same time
    if (controller != null && controller?.text == '' && initialValue != null) {
      controller?.text = initialValue.toString();
    }

    return TextFormField(
      enabled: enabled,
      onTap: onPress,
      readOnly: readOnly,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      initialValue: (controller == null) ? initialValue : null,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor,
        isDense: true,
        border: disableBorder ? InputBorder.none : null,
        focusedBorder: disableBorder ? InputBorder.none : null,
        disabledBorder: disabledBorder,
        prefixIcon: (prefixWidget != null)
            ? prefixWidget
            : (icon != null)
                ? Icon(icon, size: 25)
                : null,
        suffixIcon: (endText == null)
            ? endIcon
            : Align(
                widthFactor: 1,
                alignment: Alignment.centerRight,
                child: Text(
                  endText.toString(),
                  style: AppStyle.subtitle4.copyWith(
                    color: AppColors.systemDarkGrey,
                  ),
                ),
              ),
        errorText: validate ? 'Field cannot be empty!' : null,
        hintText: hint,
        labelText: (label != null) ? label : null,
        floatingLabelStyle: TextStyle(color: textColor),
        labelStyle: AppStyle.body2.copyWith(color: hintColor),
        hintStyle: hintStyle ?? AppStyle.body2.copyWith(color: hintColor),
      ),
      style: style,
      validator: validator,
      inputFormatters: formatters,
    );
  }
}

class SkyPasswordFormField extends StatelessWidget {
  final String? label, hint, endText;
  final TextEditingController? controller;
  final IconData? icon;
  final Widget? endIcon;
  final VoidCallback? onPress;
  final int? maxLength;
  final String? Function(String?)? validator, onSaved, onChanged, onSubmit;
  final String? errorText;
  final bool hiddenText;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? hintColor;
  final String? initialValue;
  final TextStyle? style;
  final Widget? prefixWidget;
  final bool disableBorder;
  final bool? enabled;
  final InputBorder? disabledBorder;

  const SkyPasswordFormField({
    Key? key,
    this.label,
    required this.hint,
    this.onPress,
    this.endIcon,
    this.errorText,
    this.hiddenText = true,
    this.onSaved,
    this.onChanged,
    required this.validator,
    required this.controller,
    this.icon,
    this.backgroundColor,
    this.textColor = AppColors.primary,
    this.hintColor = Colors.grey,
    this.maxLength,
    this.onSubmit,
    this.endText,
    this.initialValue,
    this.style,
    this.disableBorder = false,
    this.enabled,
    this.disabledBorder,
    this.prefixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Create
    if (controller != null && controller?.text == '' && initialValue != null) {
      controller?.text = initialValue.toString();
    }
    return TextFormField(
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      controller: controller,
      initialValue: (controller == null) ? initialValue : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor,
        isDense: true,
        border: disableBorder ? InputBorder.none : null,
        focusedBorder: disableBorder ? InputBorder.none : null,
        disabledBorder: disabledBorder,
        errorText: errorText,
        prefixIcon: (prefixWidget != null)
            ? prefixWidget
            : (icon != null)
                ? Icon(icon, size: 25)
                : null,
        suffixIcon: (endText == null)
            ? endIcon
            : Align(
                widthFactor: 1,
                alignment: Alignment.centerRight,
                child: Text(
                  endText.toString(),
                  style: AppStyle.subtitle4,
                ),
              ),
        hintText: hint,
        labelText: (label != null) ? label : null,
        floatingLabelStyle: TextStyle(color: textColor),
        labelStyle: AppStyle.body2.copyWith(color: hintColor),
        hintStyle: AppStyle.body2.copyWith(color: hintColor),
      ),
      obscureText: hiddenText,
      maxLength: maxLength,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onPress,
      onFieldSubmitted: onSubmit,
      validator: validator,
      style: style,
    );
  }
}

class RegisterPasswordRequirement extends StatelessWidget {
  final bool isValid;
  final String message;

  const RegisterPasswordRequirement(
      {Key? key, required this.isValid, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (isValid)
            ? const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              )
            : const Icon(
                Icons.close,
                color: AppColors.systemDarkGrey,
              ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(message,
              style: TextStyle(color: (isValid) ? Colors.green : Colors.grey)),
        )
      ],
    );
  }
}

class CustomFieldForm extends StatelessWidget {
  final String label, hint;
  final double? width, height;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final IconData icon;
  final IconData? endIcon;
  final int? maxLength, maxLines;
  final Function? onPress;
  final String? Function(String?)? validator, onChanged;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? hintColor;

  const CustomFieldForm({
    Key? key,
    required this.label,
    required this.hint,
    this.width,
    this.height,
    this.maxLength,
    this.maxLines,
    this.onPress,
    this.endIcon,
    this.validator,
    this.onChanged,
    this.controller,
    this.keyboardType,
    required this.icon,
    this.backgroundColor,
    this.textColor,
    this.hintColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
      ),
      child: (onPress == null)
          ? TextFormField(
            cursorColor: AppColors.primary,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              controller: controller,
              keyboardType: keyboardType,
              maxLength: maxLength,
              maxLines: maxLines,
              decoration: InputDecoration(
                filled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: AppColors.primary, width: 2)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: AppColors.primary, width: 2)),
                prefixIcon: Icon(icon),
                suffixIcon: Icon(endIcon),
                hintText: hint,
                labelText: label,
                floatingLabelStyle:
                    TextStyle(color: textColor ?? AppColors.primary),
                labelStyle: TextStyle(color: hintColor ?? Colors.grey),
                hintStyle: TextStyle(color: hintColor ?? Colors.grey),
              ),
              validator: validator,
              onChanged: onChanged,
              // validator: (value) => FieldValidator.validate(value!),
            )
          : TextFormField(
              onTap: () => onPress!(),
              readOnly: true,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              controller: controller,
              keyboardType: keyboardType,
              maxLength: maxLength,
              maxLines: maxLines,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(icon),
                suffixIcon: Icon(endIcon),
                hintText: label,
                labelText: hint,
                floatingLabelStyle:
                    TextStyle(color: textColor ?? AppColors.primary),
                labelStyle: TextStyle(color: hintColor ?? Colors.grey),
                hintStyle: TextStyle(color: hintColor ?? Colors.grey),
              ),
              validator: validator,
            ),
    );
  }
}

class CustomPasswordFieldForm extends StatelessWidget {
  final String label, hint;
  final TextEditingController? controller;
  final IconData icon;
  final Widget? endIcon;
  final Function? onPress;
  final String? Function(String?)? validator, onSaved, onChanged;
  final String? errorText;
  final bool hiddenText;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? hintColor;

  const CustomPasswordFieldForm({
    Key? key,
    required this.label,
    required this.hint,
    this.onPress,
    this.endIcon,
    this.errorText,
    this.hiddenText = true,
    this.onSaved,
    this.onChanged,
     this.validator,
     this.controller,
    required this.icon,
    this.backgroundColor,
    this.textColor,
    this.hintColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
      ),
      child: TextFormField(
        cursorColor: AppColors.primary,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(

borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          errorText: errorText,
          prefixIcon: Icon(icon),
          suffixIcon: endIcon,
          hintText: hint,
          labelText: label,
          floatingLabelStyle: TextStyle(color: textColor ?? AppColors.primary),
          labelStyle: TextStyle(color: hintColor ?? Colors.grey),
          hintStyle: TextStyle(color: hintColor ?? Colors.grey),
          
        ),
        obscureText: hiddenText,
        onSaved: onSaved,
        validator: validator,
        onChanged: onChanged,
        // validator: (value) => FieldValidator.validate(value!),
      ),
    );
  }
}
