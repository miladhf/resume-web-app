class WorkExperience {
  String image;
  String title;
  String description;
  String? link;
  String? downloadLinkText;
  String tagText;
  bool showPicsButton;
  bool haveDownloadLink;

  WorkExperience({
    required this.image,
    required this.title,
    required this.description,
    this.link,
    this.downloadLinkText,
    required this.tagText,
    required this.showPicsButton,
    required this.haveDownloadLink,
  });
}
