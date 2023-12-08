import 'package:flutter/material.dart';
import 'package:resume_web/widgets/buttons/border_button.dart';
import 'package:resume_web/widgets/gradiant_box.dart';

import '../../../data/user_data.dart';
import '../../../utils/R.dart';
import '../../../widgets/assets/svg_asset.dart';

class AboutMeMobile extends StatefulWidget {
  Function() onEmailTap, onPhoneNumberTap, onLinkedinTap, onGithubTap;
  bool isFirstRun;
  Function() firstRan;

  AboutMeMobile({
    Key? key,
    required this.onEmailTap,
    required this.onPhoneNumberTap,
    required this.onLinkedinTap,
    required this.onGithubTap,
    required this.isFirstRun,
    required this.firstRan,
  }) : super(key: key);

  @override
  _AboutMeMobileState createState() => _AboutMeMobileState();
}

class _AboutMeMobileState extends State<AboutMeMobile> {
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
                    UserData.getMyData().name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                const SizedBox(height: 30),
                FittedBox(
                  child: Text(
                    UserData.getMyData().jobTitle,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 380,
                  child: Text(
                    UserData.getMyData().description,
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Column(
                children: [
                  BorderButton(
                      onTap: widget.onEmailTap,
                      text: UserData.getMyData().email,
                      icon: SvgAsset(
                        asset: R.icons.ic_email,
                        width: 25,
                        height: 15,
                      )),
                  const SizedBox(height: 25),
                  BorderButton(
                      onTap: widget.onPhoneNumberTap,
                      text: UserData.getMyData().phoneNumber,
                      icon: SvgAsset(
                        asset: R.icons.ic_phone,
                        width: 15,
                        height: 25,
                      )),
                  const SizedBox(height: 25),
                  BorderButton(
                      onTap: widget.onLinkedinTap,
                      text: UserData.getMyData().linkedinUsername,
                      icon: SvgAsset(
                        asset: R.icons.ic_linkedin,
                        width: 25,
                        height: 25,
                      )),
                  const SizedBox(height: 25),
                  BorderButton(
                      onTap: widget.onGithubTap,
                      text: UserData.getMyData().githubUsername,
                      icon: SvgAsset(
                        asset: R.icons.ic_github,
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
