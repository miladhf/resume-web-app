import 'package:easy_localization/easy_localization.dart';
import 'package:resume_web/models/skill.dart';

class SkillsData {
  static List<Skill> getGeneralSkills() {
    return [
      Skill(text: 'selfLearning'.tr()),
      Skill(text: 'git'.tr()),
      Skill(text: 'scrum'.tr()),
      Skill(text: 'jwt'.tr()),
      Skill(text: 'oop'.tr()),
      Skill(text: 'restfulApi'.tr()),
      Skill(text: 'trello'.tr()),
      Skill(text: 'postman'.tr()),
      Skill(text: 'firebase'.tr()),
      Skill(text: 'adobeXd'.tr()),
      Skill(text: 'figma'.tr()),
    ];
  }

  static List<Skill> getFlutterSkills() {
    return [
      Skill(text: 'bloc'.tr()),
      Skill(text: 'GetX'.tr()),
      Skill(text: 'riverpod'.tr()),
      Skill(text: 'hive'.tr()),
      Skill(text: 'sqflite'.tr()),
      Skill(text: 'dio'.tr()),
      Skill(text: 'freezed'.tr()),
      Skill(text: 'pwa'.tr()),
      Skill(text: 'responsiveUi'.tr()),
      Skill(text: 'googleMap'.tr()),
      Skill(text: 'openStreetMap'.tr()),
      Skill(text: 'animations'.tr()),
      Skill(text: 'cloudFirestore'.tr()),
    ];
  }

  static List<Skill> getAndroidSkills() {
    return [
      Skill(text: 'mvvm'.tr()),
      Skill(text: 'mvp'.tr()),
      Skill(text: 'retrofit'.tr()),
      Skill(text: 'volley'.tr()),
      Skill(text: 'sqlite'.tr()),
      Skill(text: 'room'.tr()),
    ];
  }
}