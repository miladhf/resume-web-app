import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Utils {
  static bool isRtlLocale(BuildContext context) {
    return context.locale.languageCode == 'fa';
  }
}
