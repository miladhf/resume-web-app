import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PortfolioImagesDialog extends StatefulWidget {
  List<String> photos;
  int index;

  PortfolioImagesDialog({
    Key? key,
    required this.photos,
    required this.index,
  }) : super(key: key);

  @override
  _PortfolioImagesDialogState createState() => _PortfolioImagesDialogState();
}

class _PortfolioImagesDialogState extends State<PortfolioImagesDialog> {
  String count = '';

  late PageController pageController;
  final PhotoViewController _photoViewController = PhotoViewController();

  void onPageChanged(int index) {
    setState(() {
      count = "${index + 1}/${widget.photos.length}";
    });
  }

  void onPreviousTap() {
    if (pageController.page!.toInt() != 0) {
      pageController.animateToPage(
        pageController.page!.toInt() - 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void onNextTap() {
    if (pageController.page!.toInt() != widget.photos.length - 1) {
      pageController.animateToPage(
        pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  ImageProvider _getImageProvider(int index) {
    if (kIsWeb && kReleaseMode) {
      return NetworkImage('assets/${widget.photos[index]}');
    }
    return AssetImage(widget.photos[index]);
  }

  @override
  void initState() {
    super.initState();

    count = "${widget.index + 1}/${widget.photos.length}";
    pageController = PageController(initialPage: widget.index);
  }

  @override
  void dispose() {
    pageController.dispose();
    _photoViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: SizedBox(
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: _getImageProvider(index),
                  minScale: 0.2,
                  maxScale: 2.0,
                  controller: _photoViewController,
                  filterQuality: FilterQuality.high,
                  initialScale: PhotoViewComputedScale.contained * 1,
                  heroAttributes: PhotoViewHeroAttributes(tag: index),
                );
              },
              itemCount: widget.photos.length,
              loadingBuilder: (context, event) => Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes!,
                  ),
                ),
              ),
              backgroundDecoration:
                  const BoxDecoration(color: Colors.transparent),
              pageController: pageController,
              onPageChanged: onPageChanged,
            ),
            buildTextCount(height),
            buildArrowButtons(height),
            Align(
              alignment: Alignment.topLeft,
              child: buildCloseButton(),
            ),
          ],
        ),
      ),
    );
  }

  IconButton buildCloseButton() {
    return IconButton(
      icon: const Icon(
        Icons.close,
        color: Colors.white,
      ),
      color: Colors.white,
      iconSize: 30,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  Center buildArrowButtons(double height) {
    return Center(
      child: Row(
        children: [
          const SizedBox(width: 5),
          buildArrowButton(
            icon: Icons.arrow_left,
            onPressed: onPreviousTap,
          ),
          const Spacer(),
          buildArrowButton(
            icon: Icons.arrow_right,
            onPressed: onNextTap,
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }

  Container buildArrowButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(80),
      ),
      child: IconButton(
        iconSize: 40,
        icon: Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
        onPressed: onPressed,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
    );
  }

  Padding buildTextCount(double height) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.8),
      child: Container(
        width: 80,
        height: 30,
        padding: const EdgeInsets.only(top: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            count,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'shabnam-bold',
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
