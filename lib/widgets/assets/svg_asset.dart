import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  String asset;
  double? width, height;

  SvgAsset({
    Key? key,
    required this.asset,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (kIsWeb && kReleaseMode)
        ? SvgPicture.network(
            'assets/$asset',
            width: width,
            height: height,
            fit: BoxFit.fill,
          )
        : SvgPicture.asset(
      asset,
            width: width,
            height: height,
            fit: BoxFit.fill,
          );
  }
}
