import 'dart:js' as js;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_web/pages/main_tabs/about_me_tab/about_me_tab_desktop.dart';
import 'package:resume_web/pages/main_tabs/about_me_tab/about_me_tab_mobile.dart';

import '../../../data/user_data.dart';
import '../../../utils/R.dart';
import '../../../widgets/toasts.dart';

class AboutMeTab extends StatefulWidget {
  static bool isFirstRun = true;

  const AboutMeTab({Key? key}) : super(key: key);

  @override
  _AboutMeTabState createState() => _AboutMeTabState();
}

class _AboutMeTabState extends State<AboutMeTab> {
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

  _firstRan() {
    AboutMeTab.isFirstRun = false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    EasyLocalization.of(context)?.locale;

    return width >= R.size.mobileWidth
        ? AboutMeDesktop(
            onEmailTap: _onEmailTap,
            onPhoneNumberTap: _onPhoneNumberTap,
            onLinkedinTap: _onLinkedinTap,
            onGithubTap: _onGithubTap,
            firstRan: _firstRan,
            isFirstRun: AboutMeTab.isFirstRun,
          )
        : AboutMeMobile(
            onEmailTap: _onEmailTap,
            onPhoneNumberTap: _onPhoneNumberTap,
            onLinkedinTap: _onLinkedinTap,
            onGithubTap: _onGithubTap,
            firstRan: _firstRan,
            isFirstRun: AboutMeTab.isFirstRun,
          );
  }
}
