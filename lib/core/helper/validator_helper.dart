import 'package:flutter/material.dart';
import 'package:aktaris_app/core/extension/string_extension.dart';

class AppRegex {
  static const name = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
  static const nik = r'^[1-9]{16}$';
  static const npwp = r'^[0-9]{15}$';
  static const postal = r'^([1-9])[0-9]{4}$';
  static const phone = r'^(\+62|62|0|8)[1-9][0-9]{8,11}$';
  static const email = r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const upperCase = r'^(?=.*[A-Z])';
  static const lowerCase = r'^(?=.*[a-z])';
  static const containNumber = r'^(?=.*\d)';

  // contains 8 char
  // static const password = r"^.*(?=.{8,}).*$";

  /// Contains 8 char, 1 Uppercase, 1 Lowercase, 1 number
  static const password = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d!@#$%^&*()_+=-{};:',<.>?`\/\|~-]{8,}$";

  // Minimum 8 characters, at least one uppercase letter, one lowercase letter and one number:
  // static const password2 = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$';

  // Minimum 8 characters, at least one uppercase, one lowercase, and one number:
  // static const password3 = r'(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d!@#$%^&*()_+=-{};:'",<.>?`\/\|~-]{8,}';

  // Minimum 8 characters, at least one uppercase, one lowercase, one number and one special character:
  // static const password4 = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+=-{};:'",<.>?`\/\|~-])[A-Za-z\d!@#$%^&*()_+=-{};:'",<.>?`\/\|~-]{8,}$';
}

class ValidatorHelper {
  static bool validateForm(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
  }
  

  static String? field({
    required String title,
    required String value,
     String? regex,
    String? message,
  }) {
    if (value == null || value.isEmpty) {
      return '$title tidak boleh kosong';
    } else if (!RegExp(regex!).hasMatch(value)) {
      return message ?? '$title tidak boleh kosong';
    }
    return null;
  }

  static String? required(String? value) {
    if (value.isNullOrEmpty) {
      return 'Tidak boleh kosong';
    }
    return null;
  }

  static sameValue({
    required String errMessage,
    required String value,
    required String sameAs,
  }) {
    if (value != sameAs) {
      return errMessage;
    }
    return null;
  }
}