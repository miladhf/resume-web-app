import 'dart:js' as js;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/models/work_experience.dart';

import '../../../data/work_experience_data.dart';
import '../../../widgets/list_items/porfolio_item.dart';

class ExperiencesTab extends StatefulWidget {
  static bool isFirstRun = true;

  const ExperiencesTab({Key? key}) : super(key: key);

  @override
  _ExperiencesTabState createState() => _ExperiencesTabState();
}

class _ExperiencesTabState extends State<ExperiencesTab> {
  _firstRan() {
    ExperiencesTab.isFirstRun = false;
  }

  _onShowSiteTap(WorkExperience experience) {
    js.context.callMethod('open', [experience.link]);
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context)?.locale;

    return Align(
      alignment: Alignment.topCenter,
      child: ListView(
        padding: const EdgeInsets.only(bottom: 8),
        children: [
          Wrap(
            runSpacing: 50,
            spacing: 50,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              for (var experience in WorkExperiencesData.getWorkExperiences())
                PortfolioItem(
                  isFirstRun: ExperiencesTab.isFirstRun,
                  firstRan: _firstRan,
                  haveDownloadLink: experience.haveDownloadLink,
                  onDownloadLinkTap: () {
                    _onShowSiteTap(experience);
                  },
                  image: experience.image,
                  title: experience.title,
                  description: experience.description,
                  downloadLinkText: experience.downloadLinkText,
                  tagText: experience.tagText,
                  showPicsButton: experience.showPicsButton,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
