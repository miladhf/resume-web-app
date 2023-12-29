import 'package:easy_localization/easy_localization.dart';

import '../models/portfolio.dart';
import '../utils/R.dart';
import 'links.dart';

class PortfolioData {
  static final BuildTag flutterTag = BuildTag(
    image: 'assets/images/flutter_logo.png',
    title: 'Flutter',
  );
  static final BuildTag javaTag = BuildTag(
    image: 'assets/images/java_logo.png',
    title: 'Java',
  );

  static List<Portfolio> getPortfolio() {
    return [
      Portfolio(
        haveDownloadLink: true,
        logo: R.images.komak_pic,
        coverImage: 'assets/images/bazyaftche_cover_pic.png',
        title: 'komakApp'.tr(),
        description: 'komakDescription'.tr(),
        downloadLinkText: 'androidDownloadLink'.tr(),
        buildTag: flutterTag,
        showPicsButton: true,
        photos: Links.screenshots.komak,
        downloadLink: Links.link.komak_apk,
      ),
      Portfolio(
        haveDownloadLink: true,
        logo: R.images.bazyaftche_pic,
        coverImage: 'assets/images/bazyaftche_cover_pic.png',
        title: 'bazyaftcheApp'.tr(),
        description: 'bazyaftcheDescription'.tr(),
        downloadLinkText: 'androidDownloadLink'.tr(),
        buildTag: javaTag,
        showPicsButton: true,
        photos: Links.screenshots.bazyeftche,
        downloadLink: Links.link.bazyaftche_apk,
      ),
      Portfolio(
        haveDownloadLink: true,
        logo: R.images.financial_management_pic,
        coverImage: 'assets/images/bazyaftche_cover_pic.png',
        title: 'financialManagementApp'.tr(),
        description: 'financialManagementDescription'.tr(),
        downloadLinkText: 'windowsDownloadLink'.tr(),
        buildTag: flutterTag,
        showPicsButton: true,
        photos: Links.screenshots.financialManagement,
        downloadLink: Links.link.financial_management_setup,
      ),
      Portfolio(
        haveDownloadLink: true,
        logo: R.images.tebebehan_pic,
        coverImage: 'assets/images/bazyaftche_cover_pic.png',
        title: 'tebebehanApp'.tr(),
        description: 'tebebehanDescription'.tr(),
        downloadLinkText: 'cafeBazaarDownloadLink'.tr(),
        buildTag: javaTag,
        showPicsButton: true,
        photos: Links.screenshots.tebebehan,
        downloadLink: Links.link.tebebehan,
      ),
      Portfolio(
        haveDownloadLink: false,
        logo: R.images.market_pic,
        coverImage: 'assets/images/bazyaftche_cover_pic.png',
        title: 'marketApp'.tr(),
        description: 'marketDescription'.tr(),
        buildTag: javaTag,
        showPicsButton: true,
        photos: Links.screenshots.market,
      ),
    ];
  }
}
