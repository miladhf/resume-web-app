import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/data/skills_data.dart';
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
            child: buildGeneralSkillsView(
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

  GradiantBox buildGeneralSkillsView(double buttonWidth) {
    return GradiantBox(
      defaultAnimate: false,
      isFirstRun: SkillsTab.isFirstRun,
      firstRan: _firstRan,
      child: ExpansionSkillsView(
        title: 'generalSkills'.tr(),
        child: Wrap(
          runAlignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 50,
          runSpacing: 20,
          children: [
            for (var skill in SkillsData.getGeneralSkills())
              BorderButton(
                  width: buttonWidth,
                  text: skill.text,
                  onTap: () {
                    _onSkillTap(skill.text);
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
            for (var skill in SkillsData.getFlutterSkills())
              BorderButton(
                  width: buttonWidth,
                  text: skill.text,
                  onTap: () {
                    _onSkillTap(skill.text);
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
            for (var skill in SkillsData.getAndroidSkills())
              BorderButton(
                  width: buttonWidth,
                  text: skill.text,
                  onTap: () {
                    _onSkillTap(skill.text);
                  }),
          ],
        ),
      ),
    );
  }
}
