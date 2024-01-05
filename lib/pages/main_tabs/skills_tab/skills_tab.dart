import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:resume_web/data/skills_data.dart';
import 'package:resume_web/models/skill.dart';
import 'package:resume_web/utils/utils.dart';
import 'package:resume_web/widgets/skills/skill_item.dart';

import '../../../utils/R.dart';
import '../../../widgets/assets/image_asset.dart';

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

  _firstRun() {
    SkillsTab.isFirstRun = false;
  }

  void _onSkillTap(String skill) {}


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
          bottom: isDesktop ? -120 : -250,
          child: Opacity(
            opacity: 0.8,
            child: Animate(
              effects: SkillsTab.isFirstRun
                  ? [
                      MoveEffect(
                          begin: MoveEffect.neutralValue.copyWith(
                              dy: MediaQuery.of(context).size.height + 300),
                          duration: 4000.milliseconds,
                          curve: Curves.fastEaseInToSlowEaseOut),
                    ]
                  : [],
              onComplete: (c) {
                _firstRun();
              },
              child: ImageAsset(
                asset: R.images.moon_background,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Animate(
          effects: SkillsTab.isFirstRun
              ? [
                  MoveEffect(
                      begin: MoveEffect.neutralValue.copyWith(dy: -500),
                      duration: 1200.milliseconds,
                      curve: Curves.fastOutSlowIn),
                ]
              : [],
          onComplete: (c) {
            _firstRun();
          },
          child: Column(
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
          ),
        )
      ],
    );
  }

}
