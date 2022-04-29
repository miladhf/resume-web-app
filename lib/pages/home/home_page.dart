import 'package:flutter/material.dart';
import 'package:resume_web/pages/main_tabs/home_tab/home_tab.dart';
import 'package:resume_web/pages/main_tabs/portfolio_tab.dart';
import 'package:resume_web/pages/main_tabs/skills_tab.dart';

import '../../widgets/app_bar/home_app_bar.dart';

class HomePage extends StatefulWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tabs = const [
    HomeTab(),
    SkillsTab(),
    PortfolioTab(),
  ];
  int index = 0;

  _onSelectedChange(int selectedIndex) {
    setState(() {
      index = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: HomeAppBar(onSelectedChange: _onSelectedChange),
          body: tabs[index],
        ),
      ),
    );
  }
}
