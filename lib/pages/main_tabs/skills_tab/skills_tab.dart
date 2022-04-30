import 'package:flutter/material.dart';
import 'package:resume_web/pages/main_tabs/skills_tab/epansion_skills_view.dart';
import 'package:resume_web/widgets/buttons/border_button.dart';

import '../../../R.dart';
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
        title: R.strings.publicSkills,
        child: Wrap(
          runAlignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 50,
          runSpacing: 20,
          children: [
            BorderButton(
                width: buttonWidth,
                text: R.strings.selfLearning,
                onTap: () {
                  _onSkillTap(R.strings.selfLearning);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.git,
                onTap: () {
                  _onSkillTap(R.strings.git);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.scrum,
                onTap: () {
                  _onSkillTap(R.strings.scrum);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.jwt,
                onTap: () {
                  _onSkillTap(R.strings.jwt);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.oop,
                onTap: () {
                  _onSkillTap(R.strings.oop);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.restfulApi,
                onTap: () {
                  _onSkillTap(R.strings.restfulApi);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.trello,
                onTap: () {
                  _onSkillTap(R.strings.trello);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.postman,
                onTap: () {
                  _onSkillTap(R.strings.postman);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.firebase,
                onTap: () {
                  _onSkillTap(R.strings.firebase);
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
        title: R.strings.flutterSkills,
        child: Wrap(
          runAlignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 50,
          runSpacing: 20,
          children: [
            BorderButton(
                width: buttonWidth,
                text: R.strings.bloc,
                onTap: () {
                  _onSkillTap(R.strings.bloc);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.riverpod,
                onTap: () {
                  _onSkillTap(R.strings.riverpod);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.hive,
                onTap: () {
                  _onSkillTap(R.strings.hive);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.sqflite,
                onTap: () {
                  _onSkillTap(R.strings.sqflite);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.dio,
                onTap: () {
                  _onSkillTap(R.strings.dio);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.freezed,
                onTap: () {
                  _onSkillTap(R.strings.freezed);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.pwa,
                onTap: () {
                  _onSkillTap(R.strings.pwa);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.responsiveUi,
                onTap: () {
                  _onSkillTap(R.strings.responsiveUi);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.googleMap,
                onTap: () {
                  _onSkillTap(R.strings.googleMap);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.openStreetMap,
                onTap: () {
                  _onSkillTap(R.strings.openStreetMap);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.animations,
                onTap: () {
                  _onSkillTap(R.strings.animations);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.cloudFirestore,
                onTap: () {
                  _onSkillTap(R.strings.cloudFirestore);
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
        title: R.strings.androidSkills,
        child: Wrap(
          runAlignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 50,
          runSpacing: 20,
          children: [
            BorderButton(
                width: buttonWidth,
                text: R.strings.mvvm,
                onTap: () {
                  _onSkillTap(R.strings.mvvm);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.mvp,
                onTap: () {
                  _onSkillTap(R.strings.mvp);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.retrofit,
                onTap: () {
                  _onSkillTap(R.strings.retrofit);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.volley,
                onTap: () {
                  _onSkillTap(R.strings.volley);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.sqlite,
                onTap: () {
                  _onSkillTap(R.strings.sqlite);
                }),
            BorderButton(
                width: buttonWidth,
                text: R.strings.room,
                onTap: () {
                  _onSkillTap(R.strings.room);
                }),
          ],
        ),
      ),
    );
  }
}
