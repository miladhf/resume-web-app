import 'dart:js' as js;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/data/portfolio_data.dart';
import 'package:resume_web/models/portfolio.dart';

import '../../../animations/dialog_animations.dart';
import '../../../widgets/dialogs/portfolio_images_dialog.dart';
import '../../../widgets/list_items/porfolio_item.dart';

class PortfolioTab extends StatefulWidget {
  static bool isFirstRun = true;

  const PortfolioTab({Key? key}) : super(key: key);

  @override
  _PortfolioTabState createState() => _PortfolioTabState();
}

class _PortfolioTabState extends State<PortfolioTab> {
  _firstRan() {
    PortfolioTab.isFirstRun = false;
  }

  _onViewPicsTap(Portfolio portfolio) {
    showScaleTranslateAnimatedDialog(
      context: context,
      child: PortfolioImagesDialog(
        photos: portfolio.photos,
        index: 0,
      ),
    );
  }

  _onDownloadLinkTap(Portfolio portfolio) {
    js.context.callMethod('open', [portfolio.downloadLink]);
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
              for (var portfolio in PortfolioData.getPortfolio())
                PortfolioItem(
                  isFirstRun: PortfolioTab.isFirstRun,
                  firstRan: _firstRan,
                  haveDownloadLink: portfolio.haveDownloadLink,
                  onViewPicsTap: () {
                    _onViewPicsTap(portfolio);
                  },
                  onDownloadLinkTap: () {
                    _onDownloadLinkTap(portfolio);
                  },
                  image: portfolio.image,
                  title: portfolio.title,
                  description: portfolio.description,
                  downloadLinkText: portfolio.downloadLinkText,
                  tagText: portfolio.tagText,
                  showPicsButton: portfolio.showPicsButton,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
