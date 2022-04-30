import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  String asset;
  Color? color;
  double width, height;

  SvgAsset({
    Key? key,
    required this.asset,
    required this.width,
    required this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (kIsWeb && kReleaseMode)
        ? SvgPicture.network(
            'assets/$asset',
            width: width,
            height: height,
            color: color ?? Colors.white,
            fit: BoxFit.fill,
          )
        : SvgPicture.asset(
            asset,
            width: width,
            height: height,
            color: color ?? Colors.white,
            fit: BoxFit.fill,
          );
  }
}
