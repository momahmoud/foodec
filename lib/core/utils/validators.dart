import 'package:flutter/material.dart';
import 'package:foodec/core/utils/extensions.dart';

import '../constants/strings_constants.dart';
import 'app_regex.dart';

class Validators {
  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return StringsConstants.enterPassword.tr(context);
    } else if (!AppRegex.isPasswordValid(value)) {}
    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return StringsConstants.enterEmail.tr(context);
    } else if (!AppRegex.isEmailValid(value)) {
      return StringsConstants.enterValidEmail.tr(context);
    }
    return null;
  }
}
