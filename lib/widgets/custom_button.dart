import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final Widget? buttonWidget;
  final List<Color>? gradientColors;
  final double? buttonHeight;
  final bool isDisabled;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final String? text;
  final double textSize;
  final Color textColor;
  final Function()? onLongPress;

  const CustomButton({
    Key? key,
    required this.onPressed,
    this.buttonWidget,
    this.gradientColors,
    this.buttonHeight = 55,
    this.padding,
    this.isDisabled = false,
    this.boxShadow,
    this.borderRadius,
    this.backgroundColor,
    this.onLongPress,
    this.borderColor,
    this.text,
    this.textSize = 14,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: padding == null ? double.infinity : null,
      height: buttonHeight,
      decoration: BoxDecoration(
        borderRadius: borderRadius ??
            BorderRadius.circular(
              15,
            ),
        border: borderColor == null
            ? null
            : Border.all(
                color: borderColor!,
              ),
        boxShadow: boxShadow,
        color: backgroundColor,
        gradient: backgroundColor == null
            ? LinearGradient(
                colors: gradientColors ??
                    [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary,
                    ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              )
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.circular(
                  15,
                )),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            onPressed();
          },
          onLongPress: onLongPress,
          child: Center(
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: text == null
                  ? buttonWidget
                  : FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          text.toString(),
                          style:
                              Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                fontSize: textSize,
                                color: textColor,
                              ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
