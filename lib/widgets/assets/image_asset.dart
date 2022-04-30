import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  String asset;
  double width, height;

  ImageAsset({
    Key? key,
    required this.asset,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (kIsWeb && kReleaseMode)
        ? Image.network(
            'asset/$asset',
            width: width,
            height: height,
            fit: BoxFit.fill,
          )
        : Image.asset(
            asset,
            width: width,
            height: height,
            fit: BoxFit.fill,
          );
  }
}
