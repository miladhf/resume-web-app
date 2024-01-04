import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:resume_web/utils/utils.dart';

import '../../../data/user_data.dart';
import '../../../utils/R.dart';
import '../../../widgets/assets/image_asset.dart';

class AboutMeTab extends StatefulWidget {
  static bool isFirstRun = true;

  const AboutMeTab({Key? key}) : super(key: key);

  @override
  _AboutMeTabState createState() => _AboutMeTabState();
}

class _AboutMeTabState extends State<AboutMeTab> {
  _firstRun() {
    AboutMeTab.isFirstRun = false;
  }

  @override
  Widget build(BuildContext context) {
    var isDesktop = Utils.isDesktop(context);
    var isRtlLocale = Utils.isRtlLocale(context);

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      children: [
        Positioned(
          left: isRtlLocale ? -550 : null,
          right: isRtlLocale ? null : -550,
          top: 0,
          child: Opacity(
            opacity: 0.3,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-1.00, -0.01),
                  end: Alignment(1, 0.01),
                  colors: [Color(0xFF062224), Color(0xCC062224)],
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                  ),
                  Transform.flip(
                    flipX: isRtlLocale ? false : true,
                    child: ImageAsset(
                      asset: R.images.about_me_background,
                      width: 1700,
                      height: 650,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: isRtlLocale ? (isDesktop ? 70 : 0) : 0,
          bottom: 0,
          left: isRtlLocale ? (0) : (isDesktop ? 70 : 0),
          child: Animate(
            effects: AboutMeTab.isFirstRun
                ? [
                    FadeEffect(
                      duration: 1500.milliseconds,
                    ),
                    ShimmerEffect(
                      duration: 2000.milliseconds,
                      delay: 1200.milliseconds,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5),
                    ),
                  ]
                : [],
            onComplete: (c) {
              _firstRun();
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: isDesktop ? 100 : 60),
              child: Column(
                crossAxisAlignment: isDesktop
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Text(
                    'aboutMe'.tr(),
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: isDesktop ? 40 : 35,
                        ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 400,
                    height: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width *
                        (isDesktop ? 0.6 : 0.8),
                    child: Text(
                      UserData.getMyData().description,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: isDesktop ? 25 : 20,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
