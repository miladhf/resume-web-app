import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/R.dart';

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

  _onViewPicsBazyaftcheTap() {}

  _onDownloadLinkBazyaftcheTap() {}

  _onViewPicsKomakTap() {}

  _onDownloadLinkKomakTap() {}

  _onDownloadLinkTebebehanTap() {}

  _onViewPicsFinancialManagementTap() {}

  _onDownloadLinkFinancialManagementTap() {}

  _onViewPicsMarketTap() {}

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ListView(
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
                onViewPicsTap: _onViewPicsBazyaftcheTap,
                onDownloadLinkTap: _onDownloadLinkBazyaftcheTap,
                image: R.images.bazyaftche_pic,
                title: R.strings.bazyaftcheApp,
                description: R.strings.bazyaftcheDescription,
                downloadLinkText: R.strings.androidDownloadLink,
                showPicsButton: true,
              ),
              PortfolioItem(
                isFirstRun: PortfolioTab.isFirstRun,
                firstRan: _firstRan,
                haveDownloadLink: true,
                onViewPicsTap: _onViewPicsKomakTap,
                onDownloadLinkTap: _onDownloadLinkKomakTap,
                image: R.images.komak_pic,
                title: R.strings.komakApp,
                description: R.strings.komakDescription,
                downloadLinkText: R.strings.androidDownloadLink,
                showPicsButton: true,
              ),
              PortfolioItem(
                isFirstRun: PortfolioTab.isFirstRun,
                firstRan: _firstRan,
                haveDownloadLink: true,
                onDownloadLinkTap: _onDownloadLinkTebebehanTap,
                image: R.images.tebebehan_pic,
                title: R.strings.tebebehanApp,
                description: R.strings.tebebehanDescription,
                downloadLinkText: R.strings.cafeBazaarDownloadLink,
                showPicsButton: false,
              ),
              PortfolioItem(
                isFirstRun: PortfolioTab.isFirstRun,
                firstRan: _firstRan,
                haveDownloadLink: true,
                onViewPicsTap: _onViewPicsFinancialManagementTap,
                onDownloadLinkTap: _onDownloadLinkFinancialManagementTap,
                image: R.images.financial_management_pic,
                title: R.strings.financialManagementApp,
                description: R.strings.financialManagementDescription,
                downloadLinkText: R.strings.windowsDownloadLink,
                showPicsButton: true,
              ),
              PortfolioItem(
                isFirstRun: PortfolioTab.isFirstRun,
                firstRan: _firstRan,
                haveDownloadLink: false,
                onViewPicsTap: _onViewPicsMarketTap,
                image: R.images.market_pic,
                title: R.strings.marketApp,
                description: R.strings.marketDescription,
                showPicsButton: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
