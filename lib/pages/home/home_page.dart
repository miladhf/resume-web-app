import 'package:flutter/material.dart';
import 'package:resume_web/pages/main_tabs/about_me_tab/about_me_tab.dart';
import 'package:resume_web/pages/main_tabs/experiences_tab/experiences_tab.dart';
import 'package:resume_web/pages/main_tabs/home_tab/home_tab.dart';
import 'package:resume_web/pages/main_tabs/portfolio_tab/portfolio_tab.dart';
import 'package:resume_web/pages/main_tabs/skills_tab/skills_tab.dart';

import '../../utils/utils.dart';
import '../../widgets/app_bar/main_app_bar.dart';

class HomePage extends StatefulWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map<String, Widget> tabs = {
    'home': HomeTab(
      onAboutMeTap: onAboutMeTap,
      onPortfolioTap: onPortfolioTap,
    ),
    'aboutMe': const AboutMeTab(),
    'skills': const SkillsTab(),
    'workExperiences': const ExperiencesTab(),
    'portfolio': const PortfolioTab(),
  };
  int index = 0;

  void onAboutMeTap() {
    _onSelectedChange(
        tabs.values.toList().indexWhere((e) => e.runtimeType == AboutMeTab));
  }

  void onPortfolioTap() {
    _onSelectedChange(
        tabs.values.toList().indexWhere((e) => e.runtimeType == PortfolioTab));
  }

  _onSelectedChange(int selectedIndex) {
    setState(() {
      index = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          Utils.isRtlLocale(context) ? TextDirection.rtl : TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
          appBar: MainAppBar(
            tabs: tabs,
            selectedIndex: index,
            onSelectedChange: _onSelectedChange,
          ),
          body: tabs.values.toList()[index],
        ),
      ),
    );
  }
}
