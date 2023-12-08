import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  Function() onTap;
  String text;
  bool isSelected = false;

  AppBarButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        highlightColor: const Color(0x3164CFB3),
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 8, top: 5, left: 18, right: 18),
          decoration: isSelected
              ? const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0, -1),
                    end: Alignment(0, 1),
                    colors: [
                      Color(0x0064CFB3),
                      Color(0x3164CFB3),
                      // Color(0xCC64CFB3)
                    ],
                  ),
                  border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xCC64CFB3)),
                  ))
              : null,
          child: Text(
            text,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline2?.copyWith(
              color: Colors.white,
                ),
          ),
        ));
  }
}
