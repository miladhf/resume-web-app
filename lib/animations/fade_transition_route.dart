import 'package:flutter/material.dart';

class FadeTransitionRoute extends PageRouteBuilder {
  final Widget? page;

  FadeTransitionRoute({required this.page, var settings})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                page!,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation,
                  child: page,
                ),
            transitionDuration: const Duration(milliseconds: 500),
            settings: settings);
}
