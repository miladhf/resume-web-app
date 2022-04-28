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
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Container(
          padding: const EdgeInsets.only(bottom: 5),
          decoration: isSelected
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.white),
                  ),
                )
              : null,
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: isSelected ? Colors.white : Colors.grey,
                ),
          ),
        ));
  }
}
