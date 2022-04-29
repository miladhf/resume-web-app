import 'package:flutter/material.dart';

class GradiantBox extends StatefulWidget {
  Widget child;
  double? width, height;
  bool isFirstRun, animate;
  Function() firstRan;

  GradiantBox({
    Key? key,
    required this.child,
    required this.isFirstRun,
    required this.firstRan,
    required this.animate,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<GradiantBox> createState() => _GradiantBoxState();
}

class _GradiantBoxState extends State<GradiantBox>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation? widthAnimation;
  Animation? opacityAnimation;
  double? defaultWidth;
  double defaultOpacity = 0;

  @override
  void initState() {
    super.initState();
    if (widget.animate) {
      if (widget.isFirstRun) {
        defaultWidth = 0;
        _animate();
      } else {
        defaultWidth = widget.width;
        defaultOpacity = 1;
      }
    } else {
      defaultWidth = widget.width;
      defaultOpacity = 1;
    }
  }

  void _animate() async {
    await Future.delayed(const Duration(seconds: 1));
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    widthAnimation = Tween<double>(begin: 0, end: widget.width ?? 2000)
        .animate(CurvedAnimation(
      parent: controller!,
      curve: const Interval(
        0,
        0.7,
        curve: Curves.easeInOut,
      ),
    ));
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: controller!,
      curve: const Interval(
        0.4,
        1,
        curve: Curves.easeInOut,
      ),
    ));

    controller?.addListener(() {
      setState(() {});
    });
    widget.firstRan();
    await controller?.forward();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: widthAnimation?.value ?? defaultWidth,
        height: widget.height,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).primaryColor,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).colorScheme.secondary,
                ])),
        child: Opacity(
          opacity: opacityAnimation?.value ?? defaultOpacity,
          child: widget.child,
        ),
      ),
    );
  }
}
