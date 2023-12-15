import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? desktop;

  const ResponsiveWidget({
    Key? key,
    required this.mobile,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Utils.isDesktop(context)) {
      return desktop ?? mobile;
    }
    return mobile;
  }
}
