import 'package:flutter/material.dart';
import 'package:resume_web/utils/utils.dart';
import 'package:resume_web/widgets/home/home_buttons.dart';
import 'package:resume_web/widgets/home/home_icons_view.dart';

import '../../../data/user_data.dart';
import '../../../utils/R.dart';
import '../../../widgets/assets/image_asset.dart';

class HomeTab extends StatefulWidget {
  static bool isFirstRun = true;

  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  _firstRan() {
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
          asset: R.images.home_background,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: isDesktop ? 150 : 120,
          right: isDesktop ? 70 : 30,
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
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontSize: isDesktop ? 40 : 35,
                          ),
                    ),
                    Text(
                      UserData.getMyData().jobTitle,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: isDesktop ? 30 : 25,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const HomeButtons(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
