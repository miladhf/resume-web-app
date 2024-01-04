import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:resume_web/models/work_experience.dart';
import 'package:resume_web/widgets/experiences/experience_item.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/work_experience_data.dart';
import '../../../utils/utils.dart';

class ExperiencesTab extends StatefulWidget {
  static bool isFirstRun = true;

  const ExperiencesTab({Key? key}) : super(key: key);

  @override
  _ExperiencesTabState createState() => _ExperiencesTabState();
}

class _ExperiencesTabState extends State<ExperiencesTab> {
  _firstRun() {
    ExperiencesTab.isFirstRun = false;
  }

  _onShowSiteTap(WorkExperience experience) {
    launchUrl(Uri.parse(experience.link.toString()));
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context)?.locale;
    var isDesktop = Utils.isDesktop(context);

    var works = WorkExperiencesData.getWorkExperiences();

    return Animate(
      effects: ExperiencesTab.isFirstRun
          ? [
              BlurEffect(
                duration: 1200.ms,
                begin: const Offset(4, 4),
                end: const Offset(0, 0),
              ),
            ]
          : [],
      onComplete: (c) {
        _firstRun();
      },
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : 20,
          vertical: isDesktop ? 30 : 20,
        ),
        itemCount: works.length,
        itemBuilder: (c, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (i == 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'workExperiences'.tr(),
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: isDesktop ? 35 : 30,
                        ),
                  ),
                ),
              ExperienceItem(experience: works[i]),
            ],
          );
        },
        separatorBuilder: (c, i) {
          return const SizedBox(
            height: 16,
          );
        },
      ),
    );
  }
}
