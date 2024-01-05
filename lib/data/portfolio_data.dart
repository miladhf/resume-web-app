import 'package:easy_localization/easy_localization.dart';

import '../models/portfolio.dart';

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
        logo: 'assets/images/komak_pic.png',
        coverImage: 'assets/images/bazyaftche_cover_pic.png',
        title: 'komakApp'.tr(),
        description: 'komakDescription'.tr(),
        downloadLinkText: 'androidDownloadLink'.tr(),
        buildTag: flutterTag,
        showPicsButton: true,
        photos: [
          for (int i = 1; i <= 28; i++) 'assets/images/komak_screenshot_$i.jpg'
        ],
        downloadLink: 'assets/outputs/komak.apk',
      ),
      Portfolio(
        haveDownloadLink: true,
        logo: 'assets/images/bazyaftche_pic.png',
        coverImage: 'assets/images/bazyaftche_cover_pic.png',
        title: 'bazyaftcheApp'.tr(),
        description: 'bazyaftcheDescription'.tr(),
        downloadLinkText: 'androidDownloadLink'.tr(),
        buildTag: javaTag,
        showPicsButton: true,
        photos: [
          for (int i = 1; i <= 13; i++)
            'assets/images/bazyaftche_screenshot_$i.jpg'
        ],
        downloadLink: 'assets/outputs/bazyaftche.apk',
      ),
      Portfolio(
        haveDownloadLink: true,
        logo: 'assets/images/financial_management_pic.png',
        coverImage: 'assets/images/bazyaftche_cover_pic.png',
        title: 'financialManagementApp'.tr(),
        description: 'financialManagementDescription'.tr(),
        downloadLinkText: 'windowsDownloadLink'.tr(),
        buildTag: flutterTag,
        showPicsButton: true,
        photos: [
          for (int i = 1; i <= 6; i++)
            'assets/images/financial_management_screenshot_$i.png'
        ],
        downloadLink: 'assets/outputs/financial-management_setup.exe',
      ),
      Portfolio(
        haveDownloadLink: true,
        logo: 'assets/images/tebebehan_pic.png',
        coverImage: 'assets/images/bazyaftche_cover_pic.png',
        title: 'tebebehanApp'.tr(),
        description: 'tebebehanDescription'.tr(),
        downloadLinkText: 'cafeBazaarDownloadLink'.tr(),
        buildTag: javaTag,
        showPicsButton: true,
        photos: [
          for (int i = 1; i <= 5; i++)
            'assets/images/tebebehan_screenshot_$i.jpg'
        ],
        downloadLink:
            'https://cafebazaar.ir/app/com.example.omidmilad.tebebehan',
      ),
      Portfolio(
        haveDownloadLink: false,
        logo: 'assets/images/market_pic.png',
        coverImage: 'assets/images/bazyaftche_cover_pic.png',
        title: 'marketApp'.tr(),
        description: 'marketDescription'.tr(),
        buildTag: javaTag,
        showPicsButton: true,
        photos: [
          for (int i = 1; i <= 10; i++) 'assets/images/market_screenshot_$i.jpg'
        ],
      ),
    ];
  }
}
