import 'dart:js' as js;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/user_data.dart';
import '../../utils/R.dart';
import '../assets/svg_asset.dart';
import '../toasts.dart';

class HomeIconsView extends StatefulWidget {
  const HomeIconsView({Key? key}) : super(key: key);

  @override
  State<HomeIconsView> createState() => _HomeIconsViewState();
}

class _HomeIconsViewState extends State<HomeIconsView> {
  _onEmailTap() async {
    await Clipboard.setData(ClipboardData(text: UserData.getMyData().email));
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      return;
    }
    showToastSuccess(context: context, message: 'copied'.tr());
  }

  _onPhoneNumberTap() async {
    await Clipboard.setData(
        ClipboardData(text: UserData.getMyData().phoneNumber));
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      return;
    }

    showToastSuccess(context: context, message: 'copied'.tr());
  }

  _onLinkedinTap() {
    js.context.callMethod('open', [UserData.getMyData().linkedinLink]);
  }

  _onGithubTap() {
    js.context.callMethod('open', [UserData.getMyData().githubLink]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Tooltip(
          message: UserData.getMyData().email,
          child: GestureDetector(
              onTap: _onEmailTap,
              child: SvgAsset(asset: R.icons.ic_email, width: 25, height: 25)),
        ),
        const SizedBox(height: 25),
        Tooltip(
          message: UserData.getMyData().phoneNumber,
          child: GestureDetector(
              onTap: _onPhoneNumberTap,
              child: SvgAsset(
                asset: R.icons.ic_phone,
                width: 25,
                height: 25,
              )),
        ),
        const SizedBox(height: 25),
        Tooltip(
          message: UserData.getMyData().linkedinLink,
          child: GestureDetector(
              onTap: _onLinkedinTap,
              child: SvgAsset(
                asset: R.icons.ic_linkedin,
                width: 25,
                height: 25,
              )),
        ),
        const SizedBox(height: 25),
        Tooltip(
          message: UserData.getMyData().githubLink,
          child: GestureDetector(
              onTap: _onGithubTap,
              child: SvgAsset(
                asset: R.icons.ic_github,
                width: 25,
                height: 25,
              )),
        ),
      ],
    );
  }
}
