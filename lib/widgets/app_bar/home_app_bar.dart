import 'package:flutter/material.dart';
import 'package:resume_web/R.dart';

import 'app_bar_button.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  var height = 100.0;

  HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _HomeAppBarState extends State<HomeAppBar> {
  List<bool> isSelected = [true, false, false];

  _onHomeTap() {
    setState(() {
      _unSelectAll();
      isSelected[0] = true;
    });
  }

  _onSkillsTap() {
    setState(() {
      _unSelectAll();
      isSelected[1] = true;
    });
  }

  _onPortfolioTap() {
    setState(() {
      _unSelectAll();
      isSelected[2] = true;
    });
  }

  void _unSelectAll() {
    isSelected = isSelected.map((e) => e = false).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          AppBarButton(
            onTap: _onHomeTap,
            text: R.strings.home,
            isSelected: isSelected[0],
          ),
          const SizedBox(
            width: 20,
          ),
          AppBarButton(
            onTap: _onSkillsTap,
            text: R.strings.skills,
            isSelected: isSelected[1],
          ),
          const SizedBox(
            width: 20,
          ),
          AppBarButton(
            onTap: _onPortfolioTap,
            text: R.strings.portfolio,
            isSelected: isSelected[2],
          ),
        ],
      ),
    );
  }
}
