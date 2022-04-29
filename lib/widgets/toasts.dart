import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

showToastSuccess({message, required context}) {
  showToast(message,
      context: context,
      textPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.green,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 2500),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear);
}

showToastWarning({message, required context}) {
  showToast(message,
      context: context,
      textPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.red,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 2),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear);
}

showToastNormal({message, required context}) {
  showToast(message,
      context: context,
      textPadding: const EdgeInsets.all(5),
      textStyle: const TextStyle(color: Colors.white, fontSize: 20),
      backgroundColor: const Color(0xFF494949),
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 2),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear);
}
