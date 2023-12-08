class Portfolio {
  String image;
  String title;
  String description;
  String? downloadLink;
  String? downloadLinkText;
  String tagText;
  bool showPicsButton;
  bool haveDownloadLink;

  List<String> photos;

  Portfolio({
    required this.image,
    required this.title,
    required this.description,
    this.downloadLink,
    this.downloadLinkText,
    required this.tagText,
    required this.showPicsButton,
    required this.haveDownloadLink,
    required this.photos,
  });
}
