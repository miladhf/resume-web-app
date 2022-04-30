import 'package:flutter/material.dart';

var dialogAnimationDuration = const Duration(milliseconds: 500);

showScaleTranslateAnimatedDialog(
    {required BuildContext context, required Widget child}) async {
  var value = await showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      final curvedValue = -Curves.easeInOut.transform(a1.value) + 1.0;

      return Transform(
        transform: Matrix4.translationValues(0, curvedValue * 500, 0),
        child: Transform.scale(
          scale: a1.value,
          child: widget,
        ),
      );
    },
    transitionDuration: dialogAnimationDuration,
    barrierDismissible: false,
    barrierLabel: '',
    context: context,
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return child;
    },
  );

  return value;
}
