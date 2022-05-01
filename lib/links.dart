import 'package:flutter/foundation.dart';

import 'R.dart';

class Links {
  static final screenshots = _Screenshots();
  static final link = _Link();
}

class _Link {
  final bazyaftche_apk = (kIsWeb && kReleaseMode)
      ? 'assets/${R.outputs.bazyaftche_apk}'
      : R.outputs.bazyaftche_apk;
  final financial_management_setup = (kIsWeb && kReleaseMode)
      ? 'assets/${R.outputs.financial_management_setup}'
      : R.outputs.financial_management_setup;
  final komak_apk = (kIsWeb && kReleaseMode)
      ? 'assets/${R.outputs.komak_apk}'
      : R.outputs.komak_apk;
  final tebebehan = 'https://cafebazaar.ir/app/com.example.omidmilad.tebebehan';
  final linkedin = 'https://www.linkedin.com/in/milad-haselforoush-787000217/';
  var github = 'https://github.com/miladhf';
}

class _Screenshots {
  var market = [
    R.images.market_screenshot_1,
    R.images.market_screenshot_2,
    R.images.market_screenshot_3,
    R.images.market_screenshot_4,
    R.images.market_screenshot_5,
    R.images.market_screenshot_6,
    R.images.market_screenshot_7,
    R.images.market_screenshot_8,
    R.images.market_screenshot_9,
    R.images.market_screenshot_10,
  ];

  var tebebehan = [
    R.images.tebebehan_screenshot_1,
    R.images.tebebehan_screenshot_2,
    R.images.tebebehan_screenshot_3,
    R.images.tebebehan_screenshot_4,
    R.images.tebebehan_screenshot_5,
  ];

  var financialManagement = [
    R.images.financial_management_screenshot_1,
    R.images.financial_management_screenshot_2,
    R.images.financial_management_screenshot_3,
    R.images.financial_management_screenshot_4,
    R.images.financial_management_screenshot_5,
    R.images.financial_management_screenshot_6,
  ];

  var bazyeftche = [
    R.images.bazyaftche_screenshot_1,
    R.images.bazyaftche_screenshot_2,
    R.images.bazyaftche_screenshot_3,
    R.images.bazyaftche_screenshot_2,
    R.images.bazyaftche_screenshot_3,
    R.images.bazyaftche_screenshot_4,
    R.images.bazyaftche_screenshot_5,
    R.images.bazyaftche_screenshot_6,
    R.images.bazyaftche_screenshot_7,
    R.images.bazyaftche_screenshot_8,
    R.images.bazyaftche_screenshot_9,
    R.images.bazyaftche_screenshot_10,
    R.images.bazyaftche_screenshot_11,
    R.images.bazyaftche_screenshot_12,
    R.images.bazyaftche_screenshot_13,
  ];

  var komak = [
    R.images.komak_screenshot_1,
    R.images.komak_screenshot_2,
    R.images.komak_screenshot_3,
    R.images.komak_screenshot_4,
    R.images.komak_screenshot_5,
    R.images.komak_screenshot_6,
    R.images.komak_screenshot_7,
    R.images.komak_screenshot_8,
    R.images.komak_screenshot_9,
    R.images.komak_screenshot_10,
    R.images.komak_screenshot_11,
    R.images.komak_screenshot_12,
    R.images.komak_screenshot_13,
    R.images.komak_screenshot_14,
    R.images.komak_screenshot_15,
    R.images.komak_screenshot_16,
    R.images.komak_screenshot_17,
    R.images.komak_screenshot_18,
    R.images.komak_screenshot_19,
    R.images.komak_screenshot_20,
    R.images.komak_screenshot_21,
    R.images.komak_screenshot_22,
    R.images.komak_screenshot_23,
    R.images.komak_screenshot_24,
    R.images.komak_screenshot_25,
    R.images.komak_screenshot_26,
    R.images.komak_screenshot_27,
    R.images.komak_screenshot_28,
  ];
}
