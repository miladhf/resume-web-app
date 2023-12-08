import 'package:easy_localization/easy_localization.dart';

import '../models/portfolio.dart';
import '../utils/R.dart';
import 'links.dart';

class PortfolioData {
  static List<Portfolio> getPortfolio() {
    return [
      Portfolio(
        haveDownloadLink: true,
        image: R.images.komak_pic,
        title: 'komakApp'.tr(),
        description: 'komakDescription'.tr(),
        downloadLinkText: 'androidDownloadLink'.tr(),
        tagText: 'flutter'.tr(),
        showPicsButton: true,
        photos: Links.screenshots.komak,
        downloadLink: Links.link.komak_apk,
      ),
      Portfolio(
        haveDownloadLink: true,
        image: R.images.bazyaftche_pic,
        title: 'bazyaftcheApp'.tr(),
        description: 'bazyaftcheDescription'.tr(),
        downloadLinkText: 'androidDownloadLink'.tr(),
        tagText: 'java'.tr(),
        showPicsButton: true,
        photos: Links.screenshots.bazyeftche,
        downloadLink: Links.link.bazyaftche_apk,
      ),
      Portfolio(
        haveDownloadLink: true,
        image: R.images.financial_management_pic,
        title: 'financialManagementApp'.tr(),
        description: 'financialManagementDescription'.tr(),
        downloadLinkText: 'windowsDownloadLink'.tr(),
        tagText: 'flutter'.tr(),
        showPicsButton: true,
        photos: Links.screenshots.financialManagement,
        downloadLink: Links.link.financial_management_setup,
      ),
      Portfolio(
        haveDownloadLink: true,
        image: R.images.tebebehan_pic,
        title: 'tebebehanApp'.tr(),
        description: 'tebebehanDescription'.tr(),
        downloadLinkText: 'cafeBazaarDownloadLink'.tr(),
        tagText: 'java'.tr(),
        showPicsButton: true,
        photos: Links.screenshots.tebebehan,
        downloadLink: Links.link.tebebehan,
      ),
      Portfolio(
        haveDownloadLink: false,
        image: R.images.market_pic,
        title: 'marketApp'.tr(),
        description: 'marketDescription'.tr(),
        tagText: 'java'.tr(),
        showPicsButton: true,
        photos: Links.screenshots.market,
      ),
    ];
  }
}
