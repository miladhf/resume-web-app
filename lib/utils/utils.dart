import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'R.dart';

class Utils {
  static bool isRtlLocale(BuildContext context) {
    return context.locale.languageCode == 'fa';
  }

  static bool isDesktop(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width >= R.size.mobileWidth;
  }
}
