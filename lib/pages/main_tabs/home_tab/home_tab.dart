import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_web/links.dart';
import 'package:resume_web/pages/main_tabs/home_tab/home_tab_desktop.dart';
import 'package:resume_web/pages/main_tabs/home_tab/home_tab_mobile.dart';

import '../../../R.dart';
import '../../../widgets/toasts.dart';

class HomeTab extends StatefulWidget {
  static bool isFirstRun = true;

  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  _onEmailTap() async {
    await Clipboard.setData(ClipboardData(text: R.strings.myEmail));
    showToastSuccess(context: context, message: R.strings.copied);
  }

  _onPhoneNumberTap() async {
    await Clipboard.setData(ClipboardData(text: R.strings.myPhoneNumber));
    showToastSuccess(context: context, message: R.strings.copied);
  }

  _onLinkedinTap() {
    js.context.callMethod('open', [Links.link.linkedin]);
  }

  _firstRan() {
    HomeTab.isFirstRun = false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width >= R.size.mobileWidth
        ? HomeTabDesktop(
      onEmailTap: _onEmailTap,
      onPhoneNumberTap: _onPhoneNumberTap,
      onLinkedinTap: _onLinkedinTap,
      firstRan: _firstRan,
      isFirstRun: HomeTab.isFirstRun,
    )
        : HomeTabMobile(
      onEmailTap: _onEmailTap,
      onPhoneNumberTap: _onPhoneNumberTap,
      onLinkedinTap: _onLinkedinTap,
      firstRan: _firstRan,
      isFirstRun: HomeTab.isFirstRun,
    );
  }
}
