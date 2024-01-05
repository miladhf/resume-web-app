import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:resume_web/utils/utils.dart';
import 'package:resume_web/widgets/home/home_buttons.dart';
import 'package:resume_web/widgets/home/home_icons_view.dart';

import '../../../data/user_data.dart';
import '../../../widgets/assets/image_asset.dart';

class HomeTab extends StatefulWidget {
  static bool isFirstRun = true;
  final VoidCallback onAboutMeTap;
  final VoidCallback onPortfolioTap;

  const HomeTab({
    Key? key,
    required this.onAboutMeTap,
    required this.onPortfolioTap,
  }) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  _firstRun() {
    HomeTab.isFirstRun = false;
  }

  @override
  Widget build(BuildContext context) {
    var isDesktop = Utils.isDesktop(context);
    double height = 175;
    return Stack(
      alignment: Alignment.center,
      children: [
        ImageAsset(
          asset: 'assets/images/home_background.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Positioned(
            bottom: isDesktop ? 150 : 120,
            right: Utils.isRtlLocale(context) ? (isDesktop ? 70 : 30) : null,
            left: Utils.isRtlLocale(context) ? null : (isDesktop ? 70 : 30),
            child: Animate(
                effects: HomeTab.isFirstRun
                    ? [
                        MoveEffect(
                          begin: MoveEffect.neutralValue.copyWith(
                              dx: MediaQuery.of(context).size.width + 500),
                          duration: 1500.milliseconds,
                        ),
                        if (defaultTargetPlatform == TargetPlatform.android ||
                            defaultTargetPlatform == TargetPlatform.iOS)
                          BlurEffect(
                            duration: 1200.milliseconds,
                            delay: 1500.milliseconds,
                            begin: const Offset(4, 4),
                            end: const Offset(0, 0),
                          )
                        else
                          ShimmerEffect(
                            duration: 1500.milliseconds,
                            delay: 1500.milliseconds,
                          ),
                      ]
                    : [],
                onComplete: (c) {
                  _firstRun();
                },
                child: SizedBox(
                  height: height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HomeIconsView(),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        width: 2,
                        height: height,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            UserData.getMyData().name,
                            style:
                            Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                  fontSize: isDesktop ? 40 : 35,
                                ),
                          ),
                          Text(
                            UserData.getMyData().jobTitle,
                            style:
                            Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: isDesktop ? 30 : 25,
                                ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          HomeButtons(
                            onAboutMeTap: widget.onAboutMeTap,
                            onPortfolioTap: widget.onPortfolioTap,
                          ),
                        ],
                      ),
                    ],
                  ),
                ))),
      ],
    );
  }
}
