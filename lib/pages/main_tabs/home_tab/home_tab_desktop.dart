import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/utils.dart';
import 'package:resume_web/widgets/assets/svg_asset.dart';
import 'package:resume_web/widgets/buttons/border_button.dart';
import 'package:resume_web/widgets/gradiant_box.dart';

import '../../../R.dart';

class HomeTabDesktop extends StatefulWidget {
  Function() onEmailTap, onPhoneNumberTap, onLinkedinTap, onGithubTap;
  bool isFirstRun;
  Function() firstRan;

  HomeTabDesktop({
    Key? key,
    required this.onEmailTap,
    required this.onPhoneNumberTap,
    required this.onLinkedinTap,
    required this.onGithubTap,
    required this.isFirstRun,
    required this.firstRan,
  }) : super(key: key);

  @override
  _HomeTabDesktopState createState() => _HomeTabDesktopState();
}

class _HomeTabDesktopState extends State<HomeTabDesktop> {
  @override
  Widget build(BuildContext context) {
    return GradiantBox(
        defaultAnimate: true,
        height: 350,
        isFirstRun: widget.isFirstRun,
        firstRan: widget.firstRan,
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'myName'.tr(),
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'myJob'.tr(),
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    width: 400,
                    child: Text(
                      'myDescription'.tr(),
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: Utils.isRtlLocale(context)
                          ? TextAlign.right
                          : TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(height: 50),
                  BorderButton(
                      onTap: widget.onEmailTap,
                      text: 'myEmail'.tr(),
                      icon: SvgAsset(
                          asset: R.icons.ic_email, width: 25, height: 15)),
                  const SizedBox(height: 25),
                  BorderButton(
                      onTap: widget.onPhoneNumberTap,
                      text: 'myPhoneNumber'.tr(),
                      icon: SvgAsset(
                        asset: R.icons.ic_phone,
                        width: 15,
                        height: 25,
                      )),
                  const SizedBox(height: 25),
                  BorderButton(
                      onTap: widget.onLinkedinTap,
                      text: 'myLinkedin'.tr(),
                      icon: SvgAsset(
                        asset: R.icons.ic_linkedin,
                        width: 25,
                        height: 25,
                      )),
                  const SizedBox(height: 25),
                  BorderButton(
                      onTap: widget.onGithubTap,
                      text: 'myGithub'.tr(),
                      icon: SvgAsset(
                        asset: R.icons.ic_github,
                        width: 25,
                        height: 25,
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
