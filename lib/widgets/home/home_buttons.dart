import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../buttons/custom_button.dart';

class HomeButtons extends StatelessWidget {
  const HomeButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = 135;
    double buttonHeight = 30;
    return Row(
      children: [
        SizedBox(
          width: buttonWidth,
          child: CustomButton(
            buttonHeight: buttonHeight,
            onPressed: () {},
            text: 'aboutMe'.tr(),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        SizedBox(
          width: buttonWidth,
          child: CustomButton(
            buttonHeight: buttonHeight,
            onPressed: () {},
            backgroundColor: Colors.transparent,
            borderColor: Theme.of(context).colorScheme.primary,
            text: 'portfolio'.tr(),
            textColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
