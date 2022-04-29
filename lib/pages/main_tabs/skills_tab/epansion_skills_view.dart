import 'package:flutter/material.dart';

import '../../../widgets/custom_expansion_tile.dart';

class ExpansionSkillsView extends StatelessWidget {
  Widget child;
  String title;

  ExpansionSkillsView({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      collapsedTextColor: Colors.white,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(
            color: Colors.white,
            height: 0.2,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(right: 8, left: 8, top: 15, bottom: 15),
          child: child,
        ),
      ],
    );
  }
}
