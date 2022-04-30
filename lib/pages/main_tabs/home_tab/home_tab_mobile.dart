import 'package:flutter/material.dart';
import 'package:resume_web/widgets/buttons/border_button.dart';
import 'package:resume_web/widgets/gradiant_box.dart';

import '../../../R.dart';
import '../../../widgets/assets/svg_asset.dart';

class HomeTabMobile extends StatefulWidget {
  Function() onEmailTap, onPhoneNumberTap, onLinkedinTap;
  bool isFirstRun;
  Function() firstRan;

  HomeTabMobile({
    Key? key,
    required this.onEmailTap,
    required this.onPhoneNumberTap,
    required this.onLinkedinTap,
    required this.isFirstRun,
    required this.firstRan,
  }) : super(key: key);

  @override
  _HomeTabMobileState createState() => _HomeTabMobileState();
}

class _HomeTabMobileState extends State<HomeTabMobile> {
  @override
  Widget build(BuildContext context) {
    return GradiantBox(
        defaultAnimate: true,
        height: 500,
        width: MediaQuery.of(context).size.width,
        isFirstRun: widget.isFirstRun,
        firstRan: widget.firstRan,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                FittedBox(
                  child: Text(
                    R.strings.myName,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                const SizedBox(height: 30),
                FittedBox(
                  child: Text(
                    R.strings.myJob,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 350,
                  child: Text(
                    R.strings.myDescription,
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Column(
                children: [
                  BorderButton(
                      onTap: widget.onEmailTap,
                      text: R.strings.myEmail,
                      icon: SvgAsset(
                        asset: R.icons.ic_email,
                        width: 25,
                        height: 15,
                      )),
                  const SizedBox(height: 25),
                  BorderButton(
                      onTap: widget.onPhoneNumberTap,
                      text: R.strings.myPhoneNumber,
                      icon: SvgAsset(
                        asset: R.icons.ic_phone,
                        width: 15,
                        height: 25,
                      )),
                  const SizedBox(height: 25),
                  BorderButton(
                      onTap: widget.onLinkedinTap,
                      text: R.strings.myLinkedin,
                      icon: SvgAsset(
                        asset: R.icons.ic_linkedin,
                        width: 25,
                        height: 25,
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
