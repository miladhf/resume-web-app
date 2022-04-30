import 'package:flutter/material.dart';

import '../../R.dart';
import '../assets/image_asset.dart';
import '../buttons/border_button.dart';
import '../gradiant_box.dart';

class PortfolioItem extends StatefulWidget {
  bool isFirstRun;
  Function() firstRan;
  Function()? onDownloadLinkTap, onViewPicsTap;
  String image, title, description;

  String? downloadLinkText;
  bool haveDownloadLink, showPicsButton;

  PortfolioItem({
    Key? key,
    required this.isFirstRun,
    required this.firstRan,
    required this.image,
    required this.title,
    required this.description,
    required this.haveDownloadLink,
    required this.showPicsButton,
    this.onDownloadLinkTap,
    this.onViewPicsTap,
    this.downloadLinkText,
  }) : super(key: key);

  @override
  State<PortfolioItem> createState() => _PortfolioItemState();
}

class _PortfolioItemState extends State<PortfolioItem> {
  double opacity = 0;
  var duration = const Duration(seconds: 1);

  void _animate() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      opacity = 1;
    });

    widget.isFirstRun = false;
    widget.firstRan();
  }

  @override
  void initState() {
    super.initState();
    if (widget.isFirstRun) {
      _animate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isFirstRun ? opacity : 1,
      duration: duration,
      curve: Curves.easeInOut,
      child: GradiantBox(
        width: 290,
        height: 370,
        animate: false,
        isFirstRun: widget.isFirstRun,
        firstRan: widget.firstRan,
        removeAlign: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: ImageAsset(
                  asset: widget.image,
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Text(widget.title, style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 15),
              ),
            ),
            if (widget.showPicsButton) const SizedBox(height: 15),
            if (widget.showPicsButton)
              BorderButton(
                width: 150,
                text: R.strings.viewPics,
                onTap: widget.onViewPicsTap!,
              ),
            if (widget.haveDownloadLink) const SizedBox(height: 15),
            if (widget.haveDownloadLink)
              BorderButton(
                  width: 200,
                  text: widget.downloadLinkText ?? '',
                  onTap: widget.onDownloadLinkTap!),
          ],
        ),
      ),
    );
  }
}
