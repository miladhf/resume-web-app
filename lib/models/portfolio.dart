class Portfolio {
  String logo;
  String coverImage;
  String title;
  String description;
  String? downloadLink;
  String? downloadLinkText;
  BuildTag buildTag;
  bool showPicsButton;
  bool haveDownloadLink;

  List<String> photos;

  Portfolio({
    required this.logo,
    required this.coverImage,
    required this.title,
    required this.description,
    this.downloadLink,
    this.downloadLinkText,
    required this.buildTag,
    required this.showPicsButton,
    required this.haveDownloadLink,
    required this.photos,
  });
}

class BuildTag {
  String image;
  String title;

  BuildTag({
    required this.image,
    required this.title,
  });
}