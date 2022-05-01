import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/pages/main_tabs/skills_tab/epansion_skills_view.dart';
import 'package:resume_web/widgets/buttons/border_button.dart';

import '../../../widgets/gradiant_box.dart';

class SkillsTab extends StatefulWidget {
  static bool isFirstRun = true;

  const SkillsTab({Key? key}) : super(key: key);

  @override
  _SkillsTabState createState() => _SkillsTabState();
}

class _SkillsTabState extends State<SkillsTab> {
  var publicSkillsOffset = const Offset(-1, 0);
  var flutterSkillsOffset = const Offset(-1, 0);
  var androidSkillsOffset = const Offset(-1, 0);
  var duration = const Duration(seconds: 1);

  _firstRan() {
    SkillsTab.isFirstRun = false;
  }

  void _onSkillTap(String skill) {}

  void _animate() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        publicSkillsOffset = const Offset(0, 0);
      });
    }
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        flutterSkillsOffset = const Offset(0, 0);
      });
    }
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        androidSkillsOffset = const Offset(0, 0);
      });
    }

    SkillsTab.isFirstRun = false;
  }

  @override
  void initState() {
    super.initState();
    if (SkillsTab.isFirstRun) {
      _animate();
    }
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context)?.locale;

    double buttonWidth = 150;
    return ListView(
      children: [
        AnimatedSlide(
            offset:
                SkillsTab.isFirstRun ? publicSkillsOffset : const Offset(0, 0),
            duration: duration,
            curve: Curves.easeInOut,
            child: buildPublicSkillsView(
              buttonWidth,
            )),
        const SizedBox(height: 20),
        AnimatedSlide(
            offset:
            SkillsTab.isFirstRun ? flutterSkillsOffset : const Offset(0, 0),
            duration: duration,
            curve: Curves.easeInOut,
            child: buildFlutterSkillsView(
              buttonWidth,
            )),
        const SizedBox(height: 20),
        AnimatedSlide(
            offset:
            SkillsTab.isFirstRun ? androidSkillsOffset : const Offset(0, 0),
            duration: duration,
            curve: Curves.easeInOut,
            child: buildAndroidSkillsView(
              buttonWidth,
            )),
        const SizedBox(height: 20),
      ],
    );
  }

  GradiantBox buildPublicSkillsView(double buttonWidth) {
    return GradiantBox(
      defaultAnimate: false,
      isFirstRun: SkillsTab.isFirstRun,
      firstRan: _firstRan,
      child: ExpansionSkillsView(
        title: 'publicSkills'.tr(),
        child: Wrap(
          runAlignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 50,
          runSpacing: 20,
          children: [
            BorderButton(
                width: buttonWidth,
                text: 'selfLearning'.tr(),
                onTap: () {
                  _onSkillTap('selfLearning');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'git'.tr(),
                onTap: () {
                  _onSkillTap('git');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'scrum'.tr(),
                onTap: () {
                  _onSkillTap('scrum');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'jwt'.tr(),
                onTap: () {
                  _onSkillTap('jwt');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'oop'.tr(),
                onTap: () {
                  _onSkillTap('oop');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'restfulApi'.tr(),
                onTap: () {
                  _onSkillTap('restfulApi');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'trello'.tr(),
                onTap: () {
                  _onSkillTap('trello');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'postman'.tr(),
                onTap: () {
                  _onSkillTap('postman');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'firebase'.tr(),
                onTap: () {
                  _onSkillTap('firebase');
                }),
          ],
        ),
      ),
    );
  }

  GradiantBox buildFlutterSkillsView(double buttonWidth) {
    return GradiantBox(
      defaultAnimate: false,
      isFirstRun: SkillsTab.isFirstRun,
      firstRan: _firstRan,
      child: ExpansionSkillsView(
        title: 'flutterSkills'.tr(),
        child: Wrap(
          runAlignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 50,
          runSpacing: 20,
          children: [
            BorderButton(
                width: buttonWidth,
                text: 'bloc'.tr(),
                onTap: () {
                  _onSkillTap('bloc');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'riverpod'.tr(),
                onTap: () {
                  _onSkillTap('riverpod');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'hive'.tr(),
                onTap: () {
                  _onSkillTap('hive');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'sqflite'.tr(),
                onTap: () {
                  _onSkillTap('sqflite');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'dio'.tr(),
                onTap: () {
                  _onSkillTap('dio');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'freezed'.tr(),
                onTap: () {
                  _onSkillTap('freezed');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'pwa'.tr(),
                onTap: () {
                  _onSkillTap('pwa');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'responsiveUi'.tr(),
                onTap: () {
                  _onSkillTap('responsiveUi');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'googleMap'.tr(),
                onTap: () {
                  _onSkillTap('googleMap');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'openStreetMap'.tr(),
                onTap: () {
                  _onSkillTap('openStreetMap');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'animations'.tr(),
                onTap: () {
                  _onSkillTap('animations');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'cloudFirestore'.tr(),
                onTap: () {
                  _onSkillTap('cloudFirestore');
                }),
          ],
        ),
      ),
    );
  }

  GradiantBox buildAndroidSkillsView(double buttonWidth) {
    return GradiantBox(
      defaultAnimate: false,
      isFirstRun: SkillsTab.isFirstRun,
      firstRan: _firstRan,
      child: ExpansionSkillsView(
        title: 'androidSkills'.tr(),
        child: Wrap(
          runAlignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 50,
          runSpacing: 20,
          children: [
            BorderButton(
                width: buttonWidth,
                text: 'mvvm'.tr(),
                onTap: () {
                  _onSkillTap('mvvm');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'mvp'.tr(),
                onTap: () {
                  _onSkillTap('mvp');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'retrofit'.tr(),
                onTap: () {
                  _onSkillTap('retrofit');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'volley'.tr(),
                onTap: () {
                  _onSkillTap('volley');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'sqlite'.tr(),
                onTap: () {
                  _onSkillTap('sqlite');
                }),
            BorderButton(
                width: buttonWidth,
                text: 'room'.tr(),
                onTap: () {
                  _onSkillTap('room');
                }),
          ],
        ),
      ),
    );
  }
}
