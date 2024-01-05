import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/models/portfolio.dart';
import 'package:resume_web/utils/utils.dart';
import 'package:resume_web/widgets/custom_button.dart';

import '../assets/image_asset.dart';
import '../border_button.dart';
import 'custom_image_clipper.dart';

class PortfolioItem extends StatefulWidget {
  Function()? onDownloadLinkTap, onViewPicsTap;
  Portfolio portfolio;
  bool haveDownloadLink, showPicsButton;

  PortfolioItem({
    Key? key,
    required this.portfolio,
    required this.haveDownloadLink,
    required this.showPicsButton,
    this.onDownloadLinkTap,
    this.onViewPicsTap,
  }) : super(key: key);

  @override
  State<PortfolioItem> createState() => _PortfolioItemState();
}

class _PortfolioItemState extends State<PortfolioItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(20);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        onHighlightChanged: (value) {
          setState(() {
            isHover = value;
          });
        },
        onTap: () {},
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          width: 310,
          height: 370,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: borderRadius,
              // color: Colors.black.withOpacity(0.8),
              // color: Colors.grey.withOpacity(0.1),
              color: const Color(0xff232323),
              border: Border.all(
                width: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
              boxShadow: isHover
                  ? const [
                      BoxShadow(
                        color: Color(0x3364CFB3),
                        blurRadius: 10,
                        offset: Offset(-4, -4),
                        spreadRadius: 5,
                      ),
                      BoxShadow(
                        color: Color(0x3364CFB3),
                        blurRadius: 10,
                        offset: Offset(-4, -4),
                        spreadRadius: 5,
                      )
                    ]
                  : const [
                      BoxShadow(
                        color: Color(0x660F121A),
                        blurRadius: 10,
                        offset: Offset(2, 2),
                        spreadRadius: 0,
                      )
                    ]),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  ClipPath(
                    clipper: CustomImageClipper(),
                    child: ClipRRect(
                      borderRadius: borderRadius,
                      child: ImageAsset(
                        asset: widget.portfolio.coverImage,
                        width: 310,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: -15,
                      child: buildTagView(widget.portfolio.buildTag)),
                ],
              ),
              const SizedBox(height: 25),
              Text(widget.portfolio.title,
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 15),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageAsset(
                      asset: widget.portfolio.logo,
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        widget.portfolio.description,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: Utils.isRtlLocale(context) ? 15 : 14),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  if (widget.showPicsButton)
                    Expanded(
                      child: CustomButton(
                        buttonHeight: 35,
                        text: 'viewPics'.tr(),
                        onPressed: widget.onViewPicsTap!,
                      ),
                    ),
                  if (widget.haveDownloadLink)
                    const SizedBox(
                      width: 15,
                    ),
                  if (widget.haveDownloadLink)
                    Expanded(
                      child: BorderButton(
                          text: widget.portfolio.downloadLinkText ?? '',
                          onTap: widget.onDownloadLinkTap!),
                    ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTagView(BuildTag buildTag) {
    return Tooltip(
      message: buildTag.title,
      textStyle: Theme.of(context)
          .textTheme
          .displaySmall
          ?.copyWith(color: Colors.white, fontSize: 15),
      child: ClipOval(
        child: Container(
          width: 35,
          height: 35,
          color: Theme.of(context).colorScheme.primary,
          alignment: Alignment.center,
          child: ImageAsset(
            asset: buildTag.image.toString(),
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
