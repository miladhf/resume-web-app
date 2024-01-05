import 'package:easy_localization/easy_localization.dart';
import 'package:resume_web/models/work_experience.dart';

class WorkExperiencesData {
  static List<WorkExperience> getWorkExperiences() {
    return [
      WorkExperience(
        haveDownloadLink: true,
        logo: 'assets/images/vitech_logo.png',
        title: 'viraCompany'.tr(),
        description: 'viraDescription'.tr(),
        downloadLinkText: 'seeWebsite'.tr(),
        tagText: 'flutter'.tr(),
        date: 'viraDate'.tr(),
        showPicsButton: false,
        imageCover: 'assets/images/work_image_1.png',
      ),
    ];
  }
}
