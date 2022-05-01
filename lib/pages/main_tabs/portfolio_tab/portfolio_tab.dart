import 'dart:js' as js;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/utils/R.dart';
import 'package:resume_web/utils/links.dart';

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

  _onViewPicsBazyaftcheTap() {
    showScaleTranslateAnimatedDialog(
      context: context,
      child: PortfolioImagesDialog(
        photos: Links.screenshots.bazyeftche,
        index: 0,
      ),
    );
  }

  _onDownloadLinkBazyaftcheTap() {
    js.context.callMethod('open', [Links.link.bazyaftche_apk]);
  }

  _onViewPicsKomakTap() {
    showScaleTranslateAnimatedDialog(
      context: context,
      child: PortfolioImagesDialog(
        photos: Links.screenshots.komak,
        index: 0,
      ),
    );
  }

  _onDownloadLinkKomakTap() {
    js.context.callMethod('open', [Links.link.komak_apk]);
  }

  _onViewPicsTebebehanTap() {
    showScaleTranslateAnimatedDialog(
      context: context,
      child: PortfolioImagesDialog(
        photos: Links.screenshots.tebebehan,
        index: 0,
      ),
    );
  }

  _onDownloadLinkTebebehanTap() {
    js.context.callMethod('open', [Links.link.tebebehan]);
  }

  _onViewPicsFinancialManagementTap() {
    showScaleTranslateAnimatedDialog(
      context: context,
      child: PortfolioImagesDialog(
        photos: Links.screenshots.financialManagement,
        index: 0,
      ),
    );
  }

  _onDownloadLinkFinancialManagementTap() {
    js.context.callMethod('open', [Links.link.financial_management_setup]);
  }

  _onViewPicsMarketTap() {
    showScaleTranslateAnimatedDialog(
      context: context,
      child: PortfolioImagesDialog(
        photos: Links.screenshots.market,
        index: 0,
      ),
    );
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
                isFirstRun: PortfolioTab.isFirstRun,
                firstRan: _firstRan,
                haveDownloadLink: true,
                onViewPicsTap: _onViewPicsKomakTap,
                onDownloadLinkTap: _onDownloadLinkKomakTap,
                image: R.images.komak_pic,
                title: 'komakApp'.tr(),
                description: 'komakDescription'.tr(),
                downloadLinkText: 'androidDownloadLink'.tr(),
                tagText: 'flutter'.tr(),
                showPicsButton: true,
              ),
              PortfolioItem(
                isFirstRun: PortfolioTab.isFirstRun,
                firstRan: _firstRan,
                haveDownloadLink: true,
                onViewPicsTap: _onViewPicsBazyaftcheTap,
                onDownloadLinkTap: _onDownloadLinkBazyaftcheTap,
                image: R.images.bazyaftche_pic,
                title: 'bazyaftcheApp'.tr(),
                description: 'bazyaftcheDescription'.tr(),
                downloadLinkText: 'androidDownloadLink'.tr(),
                tagText: 'java'.tr(),
                showPicsButton: true,
              ),
              PortfolioItem(
                isFirstRun: PortfolioTab.isFirstRun,
                firstRan: _firstRan,
                haveDownloadLink: true,
                onViewPicsTap: _onViewPicsFinancialManagementTap,
                onDownloadLinkTap: _onDownloadLinkFinancialManagementTap,
                image: R.images.financial_management_pic,
                title: 'financialManagementApp'.tr(),
                description: 'financialManagementDescription'.tr(),
                downloadLinkText: 'windowsDownloadLink'.tr(),
                tagText: 'flutter'.tr(),
                showPicsButton: true,
              ),
              PortfolioItem(
                isFirstRun: PortfolioTab.isFirstRun,
                firstRan: _firstRan,
                haveDownloadLink: true,
                onViewPicsTap: _onViewPicsTebebehanTap,
                onDownloadLinkTap: _onDownloadLinkTebebehanTap,
                image: R.images.tebebehan_pic,
                title: 'tebebehanApp'.tr(),
                description: 'tebebehanDescription'.tr(),
                downloadLinkText: 'cafeBazaarDownloadLink'.tr(),
                tagText: 'java'.tr(),
                showPicsButton: true,
              ),
              PortfolioItem(
                isFirstRun: PortfolioTab.isFirstRun,
                firstRan: _firstRan,
                haveDownloadLink: false,
                onViewPicsTap: _onViewPicsMarketTap,
                image: R.images.market_pic,
                title: 'marketApp'.tr(),
                description: 'marketDescription'.tr(),
                tagText: 'java'.tr(),
                showPicsButton: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
