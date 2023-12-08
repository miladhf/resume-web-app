import 'package:easy_localization/easy_localization.dart';
import 'package:resume_web/models/work_experience.dart';

import '../utils/R.dart';

class WorkExperiencesData {
  static List<WorkExperience> getWorkExperiences() {
    return [
      WorkExperience(
        haveDownloadLink: true,
        image: R.images.vira_pic,
        title: 'viraCompany'.tr(),
        description: 'viraDescription'.tr(),
        downloadLinkText: 'seeWebsite'.tr(),
        tagText: 'flutter'.tr(),
        showPicsButton: false,
      ),
    ];
  }
}
