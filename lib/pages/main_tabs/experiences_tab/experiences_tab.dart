import 'dart:js' as js;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/utils/R.dart';
import 'package:resume_web/utils/links.dart';

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

  _onShowSiteTap() {
    js.context.callMethod('open', [Links.link.vira]);
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
              PortfolioItem(
                isFirstRun: ExperiencesTab.isFirstRun,
                firstRan: _firstRan,
                haveDownloadLink: true,
                onDownloadLinkTap: _onShowSiteTap,
                image: R.images.vira_pic,
                title: 'viraCompany'.tr(),
                description: 'viraDescription'.tr(),
                downloadLinkText: 'seeWebsite'.tr(),
                tagText: 'flutter'.tr(),
                showPicsButton: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
