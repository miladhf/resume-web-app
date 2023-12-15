import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  final String asset;
  final double? width, height;
  final BoxFit? fit;

  ImageAsset({
    Key? key,
    required this.asset,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (kIsWeb && kReleaseMode)
        ? Image.network(
      'assets/$asset',
            width: width,
            height: height,
            fit: fit,
          )
        : Image.asset(
      asset,
            width: width,
            height: height,
            fit: fit,
          );
  }
}
