import 'package:easy_localization/easy_localization.dart';
import 'package:resume_web/models/user.dart';

import 'links.dart';

class UserData {
  static User getMyData() {
    return User(
      name: 'myName'.tr(),
      jobTitle: 'myJob'.tr(),
      description: 'myDescription'.tr(),
      email: 'myEmail'.tr(),
      phoneNumber: 'myPhoneNumber'.tr(),
      githubUsername: 'myGithub'.tr(),
      githubLink: Links.link.github,
      linkedinUsername: 'myLinkedin'.tr(),
      linkedinLink: Links.link.linkedin,
    );
  }
}
