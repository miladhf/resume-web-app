import 'package:flutter/material.dart';
import 'package:resume_web/widgets/buttons/border_button.dart';
import 'package:resume_web/widgets/gradiant_box.dart';
import 'package:resume_web/widgets/svg_asset.dart';

import '../../../R.dart';

class HomeTabDesktop extends StatefulWidget {
  Function() onEmailTap, onPhoneNumberTap, onLinkedinTap;
  bool isFirstRun;
  Function() firstRan;

  HomeTabDesktop({
    Key? key,
    required this.onEmailTap,
    required this.onPhoneNumberTap,
    required this.onLinkedinTap,
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
                    R.strings.myName,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    R.strings.myJob,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    width: 400,
                    child: Text(
                      R.strings.myDescription,
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const SizedBox(height: 50),
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
            ],
          ),
        ));
  }
}
