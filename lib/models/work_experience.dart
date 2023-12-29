class WorkExperience {
  String? logo;
  String imageCover;
  String title;
  String description;
  String? link;
  String? downloadLinkText;
  String tagText;
  String date;
  bool showPicsButton;
  bool haveDownloadLink;

  WorkExperience({
    this.logo,
    required this.imageCover,
    required this.title,
    required this.description,
    this.link,
    this.downloadLinkText,
    required this.tagText,
    required this.date,
    required this.showPicsButton,
    required this.haveDownloadLink,
  });
}
