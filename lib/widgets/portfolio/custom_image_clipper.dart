import 'package:flutter/material.dart';

class CustomImageClipper extends CustomClipper<Path> {
  double curveWidth = 60;
  double curveHeight = 40;

  @override
  getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2 - curveWidth / 2, size.height);

    path.conicTo(
      size.width / 2,
      size.height - curveHeight,
      (size.width / 2) + curveWidth / 2,
      size.height,
      2,
    );

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0);

    path.lineTo(0, 0);

    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return true;
  }
}
