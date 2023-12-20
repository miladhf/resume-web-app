import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:resume_web/data/skills_data.dart';
import 'package:resume_web/models/skill.dart';
import 'package:resume_web/pages/main_tabs/skills_tab/epansion_skills_view.dart';
import 'package:resume_web/utils/utils.dart';
import 'package:resume_web/widgets/buttons/border_button.dart';
import 'package:resume_web/widgets/skills/skill_item.dart';

import '../../../utils/R.dart';
import '../../../widgets/assets/image_asset.dart';
import '../../../widgets/gradiant_box.dart';

class SkillsTab extends StatefulWidget {
  static bool isFirstRun = true;

  const SkillsTab({Key? key}) : super(key: key);

  @override
  _SkillsTabState createState() => _SkillsTabState();
}

class _SkillsTabState extends State<SkillsTab> {
  int skillsPerRow = 5;

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
    easy.EasyLocalization.of(context)?.locale;
    var isDesktop = Utils.isDesktop(context);

    var skills = SkillsData.getSkills();
    List<List<Skill>> skillsList = [];
    List<Skill> temp = [];

    for (int i = 0; i < skills.length; i++) {
      temp.add(skills[i]);
      if (temp.length == skillsPerRow || i == skills.length - 1) {
        skillsList.add(temp.toList());
        temp.clear();
      }
    }

    double buttonWidth = 150;
    return Stack(
      alignment: Alignment.center,
      children: [
        ImageAsset(
          asset: R.images.moon_background2,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: isDesktop ? -120 : -210,
          child: Opacity(
            opacity: 0.8,
            child: ImageAsset(
              asset: R.images.moon_background,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'skills'.tr(),
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 25,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    for (int i = 0; i < skillsList.length; i++)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              for (int j = 0; j < skillsList[i].length; j++)
                                SkillItem(
                                  skill: skillsList[i][j],
                                  isEndOfList: j != skillsList[i].length - 1,
                                )
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );

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
